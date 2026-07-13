return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = false,
  opts = {
    provider = "openrouter",
    providers = {
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        model = "tencent/hy3:free",
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
      toggle = {
        debug_prefix = "<leader>ad",
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
