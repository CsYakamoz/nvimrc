iabbr cosnt const
iabbr thsi this
iabbr mian main
iabbr gril girl

" reference: https://github.com/chemzqm/vimrc/blob/master/abbr.vim
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('PI', 'PlugInstall')
call SetupCommandAbbrs('PC', 'PlugClean')
call SetupCommandAbbrs('PU', 'PlugUpdate')
call SetupCommandAbbrs('CL', 'CocList')
call SetupCommandAbbrs('CLE', 'CocList extensions')
call SetupCommandAbbrs('CU', 'CocUpdate')
