return {
  "akinsho/nvim-bufferline.lua",
  lazy = false,
  config = function ()
    local bufferline = require("bufferline")
    bufferline.setup{
      options = {
        mode = "tabs",
        numbers = "ordinal",
        sort_by = "extension",
        separator_style = "thick",
        style_preset = bufferline.style_preset.no_italic,
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        color_icons = false,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function (_, _, diagnostics_dict)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
            or (e == "warning" and " " or "" )
            s = s .. n .. sym
          end
          return s
        end
      }
    }

    vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", {})
    vim.keymap.set("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", {})
  end
}
