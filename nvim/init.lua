vim.cmd[[
    syntax on
    
    filetype plugin on
    
    set number
    set relativenumber
    
    set cursorline
    
    set shiftwidth=4
    set tabstop=4
    set expandtab
    set ignorecase
    set smartcase
    set autoindent
    
    " set autochdir
       
    set tags=./tags,tags;$HOME

    call plug#begin()
    
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    call plug#end()

    colorscheme gruvbox
]]

require("utils.mdn")

vim.g.mapleader = " "
vim.opt.signcolumn = "yes"

-- Plugin configuration

vim.lsp.enable("marksman")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "mkd" },
  callback = function()
      vim.opt.conceallevel = 3
  end,
})

-- MDN
vim.keymap.set("n", "<leader>nn", function()
    local title = vim.fn.input("New note title: ")
    mdn_create_note(title)
end)

vim.keymap.set("n", "<leader>fe", ":Ex<CR>")
