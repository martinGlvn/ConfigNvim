return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local keymap = vim.keymap
    local tsj = require("treesj")

    tsj.setup({
      use_default_keymaps = false,
    })
  end,
}
