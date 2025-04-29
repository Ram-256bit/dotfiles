-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Tab to go to next buffer
vim.keymap.set("n", "<Tab>", function()
  vim.cmd("bnext")
end, { noremap = true, silent = true })

-- Shift+Tab to go to previous buffer
vim.keymap.set("n", "<S-Tab>", function()
  vim.cmd("bprevious")
end, { noremap = true, silent = true })

-- Set ; to : in normal mode
vim.keymap.set("n", ";", ":", { noremap = true })
