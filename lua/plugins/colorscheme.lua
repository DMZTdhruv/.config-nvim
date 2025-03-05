-- lua/plugins/colorscheme.lua
return {
  -- Rose Pine theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000, -- Make sure to load this before all the other start plugins
    config = function()
      require("rose-pine").setup({
        -- Choose variant: 'auto', 'main', 'moon', or 'dawn'
        variant = "main",
        -- Enable dark variant for dark mode, and light variant for light mode
        dark_variant = "main",
        -- Enable transparent background
        transparent = false,
        -- Make background darker or lighter for contrast
        dim_inactive_windows = false,
        -- Disable bold text
        disable_italics = false,
        -- Use for filetype highlighting
        highlight_groups = {
          -- You can customize specific highlight groups here
        },
      })
      -- Set colorscheme
      vim.cmd("colorscheme rose-pine")
      -- Additional transparency settings (uncomment if needed)
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
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
          separator_style = "slant",
          -- Apply colors that work with rose-pine
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
