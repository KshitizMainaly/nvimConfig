return {
  "mason-org/mason.nvim",
  -- Lazy-load: BufReadPre sets up Mason/mason-lspconfig before the first file
  -- is read, so servers are enabled and attach on that first open. `cmd` keeps
  -- :Mason available without having to open a file first.
  event = "BufReadPre",
  cmd = "Mason",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pyright",
        "html",
        "cssls",
        "jsonls",
        "bashls",
      },
      -- `automatic_installation` is no longer a valid option; ensure_installed
      -- handles installation and automatic_enable (default true) enables servers.
      automatic_enable = true,
    })

    -- LSP keymaps attach per-buffer whenever any server attaches. This is more
    -- reliable than an on_attach that can be overridden by per-server config.
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP keymaps",
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("gr", vim.lsp.buf.references, "References")
        map("gi", vim.lsp.buf.implementation, "Go to implementation")
        map("K", vim.lsp.buf.hover, "Hover documentation")
        map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
        map("<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
      end,
    })

    -- Merge nvim-cmp's capabilities so servers advertise everything cmp supports.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok_cmp then
      capabilities = vim.tbl_deep_extend("force", capabilities, cmp_lsp.default_capabilities())
    end

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.config("ts_ls", {
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    })

    vim.lsp.config("pyright", {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            autoImportCompletions = true,
          },
        },
      },
    })

    vim.lsp.config("html", {
      capabilities = capabilities,
      filetypes = { "html", "templ" },
    })

    vim.lsp.config("cssls", {
      capabilities = capabilities,
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          validate = true,
        },
        less = {
          validate = true,
        },
      },
    })

    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    vim.lsp.config("bashls", {
      capabilities = capabilities,
      filetypes = { "sh", "bash", "zsh" },
    })

    vim.diagnostic.config({
      virtual_text = { prefix = "●" },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
