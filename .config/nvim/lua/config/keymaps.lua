-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- [SHP] vscode.neovim - additional keymap
if vim.g.vscode then
  -- VSCode Neovim
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  
  -- remap leader key
  keymap("n", "<Space>", "", opts)
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- call vscode commands from neovim
  keymap("n", "<leader>q", "<cmd>lua require('vscode').action('workbench.action.quit')<CR>")
  keymap("n", "<leader>w", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")
  keymap("n", "<leader>b", "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")
  keymap("n", "<leader>j", "<cmd>lua require('vscode').action('workbench.action.togglePanel')<CR>")
  keymap("n", "<leader>f", "<cmd>lua require('vscode').action('actions.find')<CR>")
  keymap("n", "<leader>h", "<cmd>lua require('vscode').action('editor.action.startFindReplaceAction')<CR>")
  keymap("n", "<leader>km", "<cmd>lua require('vscode').action('workbench.action.toggleMaximizeEditorGroup')<CR>")

end
