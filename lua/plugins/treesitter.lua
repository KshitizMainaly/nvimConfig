return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local ok, ts = pcall(require, "nvim-treesitter")
    if ok and ts.setup then
      pcall(ts.setup, {
        ensure_installed = {
          "lua", "vim", "vimdoc", "markdown", "markdown_inline",
          "javascript", "typescript", "tsx", "html", "css", "json",
          "python", "bash", "yaml", "toml",
        },
        auto_install = false,
      })
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
