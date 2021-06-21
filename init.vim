" csyakamoz-neovim's init.vim
"
" reference:
"   - https://github.com/vim-china/hello-vim
"   - https://github.com/jaywcjlove/vim-web
"   - https://github.com/skywind3000/vim-init
"   - https://github.com/hardcoreplayers/ThinkVim
"   - https://github.com/chemzqm/vimrc
"   - https://github.com/voldikss/dotfiles/tree/dev/home/.config/nvim

let s:dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

command! -nargs=1 LoadScript exec 'source '.s:dir.'/'.'<args>'

LoadScript basic.vim
LoadScript abbr.vim

if filereadable(s:dir . '/before-plugin.vim')
    exe 'source ' . s:dir . '/before-plugin.vim'
endif

LoadScript plugin.vim
LoadScript plugin-setting.vim

if filereadable(s:dir . '/after-plugin.vim')
    exe 'source ' . s:dir . '/after-plugin.vim'
endif

for s:path in split(glob(s:dir . '/script/*.vim'), "\n")
    exe 'source ' . s:path
endfor
