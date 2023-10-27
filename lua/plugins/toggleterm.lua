return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 8, -- tamaño de terminal
      open_mapping = [[<c-t>]], -- abrir de terminal
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = false,
      -- direction = "float",
      close_on_exit = true,
      shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
      float_opts = {
        border = "curved",
        winblend = 0,
      },

      --
    })
  end,
}
