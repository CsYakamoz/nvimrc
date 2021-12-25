vim.cmd [[
try
    colorscheme everforest
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
]]
