vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>s", "<cmd>split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { noremap = true, silent = true })
