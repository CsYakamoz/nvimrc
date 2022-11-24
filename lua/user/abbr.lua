vim.cmd([[
iabbr cosnt const
iabbr thsi this
iabbr mian main
iabbr gril girl
iabbr ture true

" Refer: https://github.com/chemzqm/vimrc/blob/master/abbr.vim
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('ch', 'checkhealth')

call SetupCommandAbbrs('cl', 'CocList')
call SetupCommandAbbrs('cr', 'CocRestart')
call SetupCommandAbbrs('co', 'CocOutline')

call SetupCommandAbbrs('dvb', 'DiffviewFileHistory %') " DiffviewFileHistory Current Buffer
call SetupCommandAbbrs('dvc', 'DiffviewClose')

" dont use SetupCommandAbbrs, because need to support visual mode
cabbr lda LinediffAdd
call SetupCommandAbbrs('ldb', '%Linediff') " Linediff Current Buffer
call SetupCommandAbbrs('ldr', 'LinediffReset')
call SetupCommandAbbrs('lds', 'LinediffShow')
]])
