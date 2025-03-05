return {
  "andweeb/presence.nvim",
  config = function()
    require("presence").setup({
      auto_update = true,
      neovim_image_text = "I USE NEOVIM BTW.",
      main_image = "neovim",
      log_level = nil,
      editing_text = "Editing %s",
      file_explorer_text = "Browsing %s",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      client_id = "1330935059443744838",

      buttons = {
        { label = "GitHub", url = "https://github.com/DMZTdhruv" },
      },
    })
  end,
}
