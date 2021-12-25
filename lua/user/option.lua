local optionList = {
    wrap = false,
    number = true,
    hidden = true,
    cursorline = true,
    termguicolors = true,
    swapfile = false,
    autoread = true,
    background = 'light',
    synmaxcol = 300,
    colorcolumn = { 80, 120 },
    signcolumn = 'yes',
    list = true,

    -- time
    updatetime = 300,
    timeoutlen = 500,
    jumpoptions = 'stack',

    -- match
    showmatch = true,
    matchtime = 1,

    -- undo
    -- undofile = true,
    -- undodir = "~/.cache/vim/undo",

    -- scrolloff
    scrolloff = 3,
    sidescrolloff = 3,

    -- search
    hlsearch = true,
    ignorecase = true,
    smartcase = true,

    -- tab
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    shiftround = true,
    smartindent = true,

    -- split
    splitright = true,
    splitbelow = true,
}

vim.opt.shortmess:append({ c = true })
vim.opt.listchars = { extends = '>', tab = '▸ ', trail = '·' }

for k, v in pairs(optionList) do
    vim.opt[k] = v
end

