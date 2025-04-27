return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local php_extra_args = {
        "--standard=PSR12",
        -- "--exclude=PEAR.Commenting.FunctionComment.Missing",
        "--exclude=Generic.Files.LineLength",
        "--exclude=Generic.Files.LineLength.TooLong",
    }

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofumpt,
        require("none-ls.diagnostics.eslint_d"),

        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.phpcbf.with({
            extra_args = php_extra_args
        }),
        null_ls.builtins.diagnostics.phpcs.with({
            extra_args = php_extra_args
        }),
        null_ls.builtins.completion.spell,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
