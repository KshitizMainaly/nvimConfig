return {
  "yetone/avante.nvim",
  -- Load only when an Avante command or keybinding is first used, instead of
  -- on VeryLazy, so the heavy AI plugin (and its deps) don't load after startup.
  cmd = {
    "AvanteAsk",
    "AvanteChat",
    "AvanteEdit",
    "AvanteToggle",
    "AvanteRefresh",
    "AvanteFocus",
    "AvanteStop",
    "AvanteClear",
    "AvanteModels",
    "AvanteHistory",
    "AvanteBuild",
  },
  keys = {
    { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "Avante: Ask" },
    { "<leader>ae", mode = { "n", "v" }, ":AvanteEdit<cr>", desc = "Avante: Edit", silent = true },
    { "<leader>ar", "<cmd>AvanteRefresh<cr>", desc = "Avante: Refresh" },
  },
  version = false,
  -- Download the prebuilt Windows native libraries on install/update so the
  -- `avante_templates.dll` stays in sync with the plugin (no Rust required).
  build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
  config = function(_, opts)
    require("avante").setup(opts)
    -- Force set Shift+Tab in avante sidebar buffers to override nvim-cmp's
    -- insert-mode mapping that can intercept it.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "AvanteInput", "AvanteResult" },
      callback = function(ev)
        -- Normal mode: cycle focus backward through avante sidebar windows
        vim.keymap.set("n", "<S-Tab>", function()
          local wins = {}
          for _, w in ipairs(vim.api.nvim_list_wins()) do
            local ft = vim.bo[vim.api.nvim_win_get_buf(w)].filetype
            if ft:match("^Avante") then
              table.insert(wins, w)
            end
          end
          if #wins < 2 then return end
          local cur = vim.api.nvim_get_current_win()
          for i, w in ipairs(wins) do
            if w == cur then
              local prev = i - 1
              if prev < 1 then prev = #wins end
              vim.api.nvim_set_current_win(wins[prev])
              return
            end
          end
        end, { buffer = ev.buf, noremap = true, silent = true, desc = "Avante: Reverse switch window" })
      end,
    })
  end,
  opts = {
    provider = "openrouter",
    providers = {
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        model = "openrouter/free",
        api_key_name = "OPENROUTER_API_KEY",
        headers = {
          ["HTTP-Referer"] = "http://localhost",
          ["X-Title"] = "Neovim AI",
        },
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 4096,
        },
      },
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = true,
      support_paste_from_clipboard = true,
      auto_focus_sidebar = false,
      enable_token_counting = false,
      use_cwd_as_project_root = true,
    },
    mappings = {
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      stop = "<leader>as",
      toggle = {
        debug_prefix = "<leader>ad",
      },
      submit = {
        normal = "<CR>",
        insert = "<CR>",
      },
      sidebar = {
        reverse_switch_windows = "<S-Tab>",
      },
    },
    selector = { provider = "telescope" },
    input = { provider = "dressing" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MunifTanjim/nui.nvim",
      config = function()
        local Split = require("nui.split")
        local orig_close = Split._close_window
        Split._close_window = function(self)
          if not self.winid then
            return
          end
          if vim.api.nvim_win_is_valid(self.winid) and not self._.pending_quit then
            if vim.fn.winnr("$") > 1 then
              vim.api.nvim_win_close(self.winid, true)
            end
          end
          self.winid = nil
        end
      end,
    },
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },
}
