-- ==================== LAZY.NVIM PLUGIN CONFIGURATION ====================
-- Plugin manager setup and plugin specifications

require("lazy").setup({
  -- Import all plugin specifications from lua/plugins/
  spec = {
    { import = "plugins" },
  },

  -- Configuration options
  defaults = {
    lazy = false, -- Don't lazy-load by default
    version = false, -- Always use the latest git commit
  },

  -- Installation options
  install = { colorscheme = { "catppuccin", "habamax" } },

  -- Checker options (automatically check for updates)
  checker = {
    enabled = true,
    notify = false,
  },

  -- UI customization
  ui = {
    border = "rounded",
  },

  -- Performance optimizations
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
