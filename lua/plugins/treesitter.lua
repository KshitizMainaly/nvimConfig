return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdate", "TSInstall", "TSInstallInfo" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "markdown", "markdown_inline",
        "javascript", "typescript", "tsx", "html", "css", "json",
        "python", "bash", "yaml", "toml",
      },
      auto_install = false,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = { ["<leader>na"] = "@parameter.inner" },
          swap_previous = { ["<leader>pa"] = "@parameter.inner" },
        },
      },
    })

    -- Neovim 0.12 yields injection-query nodes whose methods (incl. `range`)
    -- are nil during markdown injection processing (nvim-treesitter master),
    -- so nvim-treesitter's `set-lang-from-info-string!` directive crashes on
    -- every fenced code block. The dead node cannot be read, so recover the
    -- language from the buffer's fenced-code-block opening fences instead.
    -- This keeps code-block syntax highlighting working without the crash.
    -- (Proper fix: update Neovim or align nvim-treesitter/parser ABI.)
    pcall(require, "nvim-treesitter.query_predicates")
    local tq = require("vim.treesitter.query")
    local info_aliases = { ex = "elixir", pl = "perl", sh = "bash", uxn = "uxntal", ts = "typescript" }

    local fence_state = {} -- bufnr -> { tick, langs = {}, idx = 0 }

    local function fence_langs(bufnr)
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return {}
      end
      local langs = {}
      local in_block = false
      for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
        if line:match("^%s*```") or line:match("^%s*~~~") then
          if in_block then
            in_block = false
          else
            local lang = line:match("^%s*```%s*([%w_+#%-]*)")
              or line:match("^%s*~~~%s*([%w_+#%-]*)")
            if lang and lang ~= "" then
              table.insert(langs, lang:lower())
            end
            in_block = true
          end
        end
      end
      return langs
    end

    tq.add_directive("set-lang-from-info-string!", function(_, _, bufnr, _, metadata)
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end
      local tick = vim.b[bufnr].changedtick
      local s = fence_state[bufnr]
      if not s or s.tick ~= tick then
        s = { tick = tick, langs = fence_langs(bufnr), idx = 0 }
        fence_state[bufnr] = s
      end
      s.idx = s.idx + 1
      local alias = s.langs[s.idx]
      if not alias then
        return
      end
      metadata["injection.language"] = vim.filetype.match({ filename = "a." .. alias })
        or info_aliases[alias]
        or alias
    end, { force = true })
  end,
}
