iabbr cosnt const
iabbr thsi this
iabbr mian main
iabbr gril girl
iabbr ture true

" reference: https://github.com/chemzqm/vimrc/blob/master/abbr.vim
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('ch', 'checkhealth')
call SetupCommandAbbrs('pi', 'PlugInstall')
call SetupCommandAbbrs('pc', 'PlugClean')
call SetupCommandAbbrs('pu', 'PlugUpdate')
call SetupCommandAbbrs('cl', 'CocList')
call SetupCommandAbbrs('cle', 'CocList extensions')
call SetupCommandAbbrs('cu', 'CocUpdate')
call SetupCommandAbbrs('th', 'Thesaurus')
