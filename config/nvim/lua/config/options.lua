vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Set default split behavior
vim.cmd [[set splitright splitbelow]]

-- Set highlight on search
vim.o.hlsearch = true
vim.keymap.set({ 'n' }, '<ESC>', ':noh<CR>', { silent = true})

-- Make line numbers default
vim.wo.relativenumber = true
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

vim.opt.smartindent = true


-- SET LINE OVERFLOW MARKER
vim.cmd [[set colorcolumn=120]]
vim.cmd [[highlight ColorColumn ctermbg=0]]

-- Save undo history
vim.o.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox]]

