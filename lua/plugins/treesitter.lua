return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "axelvc/template-string.nvim",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "prisma",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "tsx",
          "terraform",
          "swift",
          "sql",
          "solidity",
          "rust",
          "python",
          "prisma",
          "kotlin",
          "latex",
          "java",
          "http",
          "go",
          "astro",
        },
        sync_install = false,

        auto_install = true,

        highlight = {
          enable = true,

          additional_vim_regex_highlighting = false,
        },
        autotag = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<enter>",
            node_incremental = "<enter>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })

      require("template-string").setup({})
    end,
  },
}
