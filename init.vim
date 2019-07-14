" csportrait-neovim's init.vim
"
" reference:
"   - https://github.com/vim-china/hello-vim
"   - https://github.com/jaywcjlove/vim-web
"   - https://github.com/skywind3000/vim-init

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

command! -nargs=1 LoadScript exec 'source '.s:home.'/'.'<args>'

LoadScript basic.vim
LoadScript plugin.vim
LoadScript plugin-setting.vim
LoadScript shortcut.vim
LoadScript script.vim

