-- ==================== AUTOCOMMANDS ====================
-- Automatic commands for various file types and events
 
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General Settings
local general = augroup("General", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Auto-delete fugitive buffers
autocmd("BufReadPost", {
  group = general,
  pattern = "fugitive://*",
  command = "set bufhidden=delete",
})

-- Check if file has changed outside of vim
autocmd({ "FocusGained", "BufEnter" }, {
  group = general,
  command = "checktime",
})

-- Resize splits when window is resized
autocmd("VimResized", {
  group = general,
  command = "wincmd =",
})

-- File Type Specific Settings
local filetype = augroup("FileTypeSettings", { clear = true })

-- Git commit messages
autocmd("FileType", {
  group = filetype,
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 72
  end,
})

-- Markdown files
autocmd("FileType", {
  group = filetype,
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- Close certain filetypes with 'q'
autocmd("FileType", {
  group = filetype,
  pattern = {
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
