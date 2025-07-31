return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    local php_extra_args = {
      "--standard=PSR12",
      -- "--exclude=PEAR.Commenting.FunctionComment.Missing",
      "--exclude=Generic.Files.LineLength",
      "--exclude=Generic.Files.LineLength.TooLong",
    }

    -- list of formatters & linters for mason to install
    require("mason-null-ls").setup({
      ensure_installed = {
        "shfmt",
        "prettier",
        "goimports",
        "gofumpt",
        "eslint_d",
        "phpcbf",
        "phpcs",
        "black",
        "csharpier",
      },
      automatic_installation = true,
    })

    local sources = {
      formatting.stylua,
      formatting.shfmt,
      formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
      formatting.goimports,
      formatting.gofumpt,
      require("none-ls.diagnostics.eslint_d"),
      formatting.black,
      formatting.csharpier,
      formatting.phpcbf.with({ extra_args = php_extra_args }),
      diagnostics.phpcs.with({ extra_args = php_extra_args }),
    }

    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      sources = sources,
      -- on_attach = function(client, bufnr)
      --   if client.supports_method "textDocument/formatting" then
      --     vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       group = augroup,
      --       buffer = bufnr,
      --       callback = function()
      --         vim.lsp.buf.format { async = false }
      --       end,
      --     })
      --   end
      -- end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
