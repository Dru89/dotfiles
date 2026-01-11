-- ==================== COLORSCHEMES ====================
-- Color schemes and appearance

return {
  -- Modern dark colorscheme (similar to molokai but maintained)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- Dark theme similar to molokai
      transparent_background = false,
      term_colors = true,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },

  -- Original molokai (has compatibility issues with new Neovim, kept for reference)
  -- {
  --   "tomasr/molokai",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.molokai_original = 1
  --     vim.g.rehash256 = 1
  --     vim.cmd([[colorscheme molokai]])
  --   end,
  -- },

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme tokyonight-night]])
  --   end,
  -- },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme kanagawa]])
  --   end,
  -- },
}
