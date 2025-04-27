return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function ()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true
    }
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function ()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })
      lspconfig.ruff.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
      lspconfig.intelephense.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off"
            }
          }
        }
      })

      lspconfig.emmet_language_server.setup({
        capabilities = capabilities,
        filetypes = { "css", "html", "sass", "scss" }
      })

      lspconfig.lemminx.setup({
        capabilities = capabilities,
        filetypes = { "xml", "xsd", "xsl", "xslt", "svg" }
      })

      local pid = vim.fn.getpid()
      local omnisharp_bin = "/usr/bin/OmniSharp"

      lspconfig.omnisharp.setup({
        capabilities = capabilities,
        cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
        settings = {
            FormatingOptions = {
                EnableEditorConfig = true
            },
            MsBuild = {},
            RoslynExtensionOptions = {},
            Sdk = {
                IncludePreresleases = true
            }
        }
      })
      -- lspconfig.csharp_ls.setup({
      --   capabilities = capabilities
      -- })

      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})

    end
  },
}
