return {
  "laytan/cloak.nvim",
  config = function ()
    require("cloak").setup({
      enable = true,
      cloak_character = "*",
      highlight_group = "Comment",
      patterns = {
        {
          file_pattern = {
            ".env*",
            ".dev.vars",
          },
          cloak_pattern = "=.+"
        },
        {
          file_pattern = {
            "config.yaml",
            "credentials.yaml",
          },
          cloak_pattern = ":.+"
        },
      }
    })
  end
}
