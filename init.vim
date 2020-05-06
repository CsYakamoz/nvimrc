" csyakamoz-neovim's init.vim
"
" reference:
"   - https://github.com/vim-china/hello-vim
"   - https://github.com/jaywcjlove/vim-web
"   - https://github.com/skywind3000/vim-init
"   - https://github.com/hardcoreplayers/ThinkVim

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

command! -nargs=1 LoadScript exec 'source '.s:home.'/'.'<args>'

LoadScript basic.vim

if get(g:, 'plugin_level') == 1
    LoadScript plugin.vim
    LoadScript plugin-setting.vim
    LoadScript script.vim
endif

