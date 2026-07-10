return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local ts_install = require("nvim-treesitter.install")
    local parsers = {
      "javascript", "typescript", "tsx", "html", "css", "json",
      "yaml", "toml", "markdown", "markdown_inline", "python", "bash",
      "lua", "vim", "vimdoc", "c", "gitignore", "diff",
    }

    for _, parser in ipairs(parsers) do
      local installed, _ = pcall(vim.treesitter.language.inspect, parser)
      if not installed then
        pcall(ts_install.install, parser)
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
