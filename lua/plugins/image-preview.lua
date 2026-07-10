return {
  "3rd/image.nvim",
  build = false,
  ft = { "markdown", "html" },
  opts = {
    processor = "magick_cli",
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = true,
        only_render_image_at_cursor_mode = "popup",
        floating_windows = false,
        filetypes = { "markdown", "vimwiki" },
      },
      html = {
        enabled = true,
        filetypes = { "html" },
      },
    },
  },
}
