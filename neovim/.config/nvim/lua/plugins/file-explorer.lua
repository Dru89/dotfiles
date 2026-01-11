-- ==================== FILE EXPLORER ====================
-- Modern file explorer with nvim-tree
-- Replaces: NERDTree

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- File icons
    },
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
      { "<leader>f", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in explorer" },
      { "<C-\\>", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in explorer" },
    },
    config = function()
      -- Disable netrw (recommended by nvim-tree)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        -- Minimal UI like NERDTree
        renderer = {
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
          indent_markers = {
            enable = true,
          },
        },

        -- Window size like NERDTree
        view = {
          width = 30,
          side = "left",
        },

        -- Git integration
        git = {
          enable = true,
          ignore = false,
        },

        -- Filters
        filters = {
          dotfiles = false,
          custom = { ".git", "node_modules", ".cache" },
        },

        -- Actions
        actions = {
          open_file = {
            quit_on_open = false,
            window_picker = {
              enable = true,
            },
          },
        },

        -- Update focused file
        update_focused_file = {
          enable = true,
          update_root = false,
        },
      })
    end,
  },

  -- File icons (used by many plugins)
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
