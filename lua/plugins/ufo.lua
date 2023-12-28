return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  opts = {
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
  },

  config = function(_, opts)
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("local_detach_ufo", { clear = true }),
      pattern = opts.filetype_exclude,
      callback = function()
        require("ufo").detach()
      end,
    })
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.opt.foldlevelstart = 99
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local foldIndicator = "..."
      local sufWidth = vim.fn.strdisplaywidth(foldIndicator)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may be less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            foldIndicator = foldIndicator .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { foldIndicator, "UfoFoldedBg" }) -- Usa "UfoFoldedBg" para el grupo de resaltado del fondo del indicador
      return newVirtText
    end

    require("ufo").setup({
      fold_virt_text_handler = handler,
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          winhighlight = "#342342",
          winblend = 0,
        },
      },
    })
  end,
}
