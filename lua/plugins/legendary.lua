return {
  "mrjones2014/legendary.nvim",
  dependencies = {
    "hinell/duplicate.nvim",
  },
  priority = 10000,
  lazy = false,
  config = function()
    local legendary = require("legendary")
    legendary.keymaps({
      -- duplicate
      {
        description = "Line: duplicate up",
        mode = { "n" },
        "<S-l>",
        "<CMD>LineDuplicate -1<CR>",
      },
      {
        description = "Line: duplicate down",
        mode = { "n" },
        "<S-a>",
        "<CMD>LineDuplicate +1<CR>",
      },
      {
        description = "Selection: duplicate up",
        mode = { "v" },
        "<S-A-Up>",
        "<CMD>VisualDuplicate -1<CR>",
      },
      {
        description = "Selection: duplicate down",
        mode = { "v" },
        "<S-l>",
        "<CMD>VisualDuplicate +1<CR>",
      },
      -- project
      {
        description = "find a project based on patterns",
        mode = { "n" },
        "<leader>d",
        "<CMD>Telescope neovim-project discover<CR>",
      },
      {
        description = "select a project from your recent history",
        mode = { "n" },
        "<leader>h",
        "<CMD>Telescope neovim-project history<CR>",
      },
    })
  end,
}
