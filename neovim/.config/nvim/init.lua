require("utils.extension")

-- ==================== MODERN NEOVIM CONFIG ====================
-- Modernized from legacy vim config to Lua-based configuration
-- Using lazy.nvim for plugin management

-- Set leader key early (must be before lazy.nvim setup)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core settings
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Load plugins with lazy.nvim
require("config.lazy")
