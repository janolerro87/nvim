return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            options = {
                theme = "auto",
                icons_enabled = true,
                globalstatus = true,
                disabled_filetypes = {
                    statusline = {
                        "dashboard",
                        "alpha",
                        "starter",
                        "lazy",
                        "mason",
                    }
                },
            },
            extensions = { "quickfix", "fugitive" },
            sections = {
                lualine_a = { { "mode", upper = true } },
                lualine_b = { { "branch", icon = "" }, "db_ui#statusline" },
                lualine_c = { { "filename", file_status = true, path = 1 } },
                lualine_x = {
                    "diagnostics",
                    {
                        "diff",
                        symbols = { added = ' ', modified = ' ', removed = ' ' },
                        source = function()
                            local gitsigns = vim.b.gitsigns_status_dict
                            if gitsigns then
                                return {
                                    added = gitsigns.added,
                                    modified = gitsigns.changed,
                                    removed = gitsigns.removed,
                                }
                            end
                        end,
                    },
                    -- {
                    --     require("noice").api.status.mode.get,
                    --     cond = require("noice").api.status.mode.has,
                    --     color = { fg = "#ff9e64" },
                    -- },
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_y = { "filetype" },
                -- lualine_z = { "location" },
                lualine_z = {
                    { "progress", separator = " ", padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },
            },
            -- winbar = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = { "filename" },
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {},
            -- },
            -- inactive_winbar = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = { "filename" },
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {},
            -- },
        }
    end,
}
