return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true,
    handler_opts = { border = "rounded" },
    floating_window = true,
    floating_window_above_cur_line = true,
    floating_window_off_x = 5,
    floating_window_off_y = 0,
    close_timeout = 4000,
    fix_pos = false,
    hint_enable = true,
    hint_prefix = "󰊕 ",
    hint_scheme = "String",
    hi_parameter = "LspSignatureActiveParameter",
    max_height = 12,
    max_width = 80,
    transparency = 20,
    toggle_key = "<C-k>",
    select_signature_key = "<C-n>",
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.signatureHelpProvider then
          require("lsp_signature").on_attach(opts, args.buf)
        end
      end,
    })
  end,
}