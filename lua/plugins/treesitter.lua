return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "javascript", "typescript", "tsx", "html", "css", "json",
        "yaml", "toml", "markdown", "markdown_inline", "python", "bash",
        "lua", "vim", "vimdoc", "c", "gitignore", "diff" },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
