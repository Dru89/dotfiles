-- ==================== TREESITTER ====================
-- Modern syntax highlighting and code understanding
-- Replaces: vim-javascript, vim-jsx, typescript-vim, vim-coffee-script, etc.

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    config = function()
      local treesitter = require('nvim-treesitter')
      treesitter.setup({})

      local should_install = {
        "bash",
        "c",
        "css",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "ruby",
        "rust",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }

      treesitter.install(table.except(should_install, treesitter.get_installed()))

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          if
            vim.list_contains(
              treesitter.get_installed(),
              vim.treesitter.language.get_lang(args.match)
            )
          then
            vim.treesitter.start(args.buf)
          end
        end
      })
    end,
  },

  -- Treesitter text objects (separate plugin)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
  },

  -- -- Show code context (replaces tagbar functionality)
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      enable = true,
      max_lines = 3,
    },
  },
}
