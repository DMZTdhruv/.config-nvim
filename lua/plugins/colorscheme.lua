-- lua/plugins/colorscheme.lua
return {
  -- Rose Pine theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "down",
        dark_variant = "main",
        transparent = false,
        dim_inactive_windows = true,
        disable_italics = true,
        highlight_groups = {
          Cursor = { bg = "#ffffff", fg = "#1e1e2e" }, -- Change cursor color
          CursorLine = { bg = "#2a2a37" }, -- Optional: Line highlight
          CursorColumn = { bg = "#2a2a37" }, -- Optional: Column highlight
        },
      })
      -- Set colorscheme
      vim.cmd("colorscheme rose-pine")
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      --
    end,
  },
  -- Status line with rose-pine support
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "rose-pine",
          component_separators = "|",
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              path = 1, -- Show relative path
              file_status = true,
            },
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
  -- Bufferline for tab management
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
            },
          },
          separator_style = "",
          themable = true,
        },
        -- Optional: Custom highlight groups for better integration with rose-pine
        highlights = require("rose-pine.plugins.bufferline"),
      })
    end,
  },
  -- Add devicons for a better look
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
