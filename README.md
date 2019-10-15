# CsYakamoz's vimrc

## Requirement

- [neovim](https://github.com/neovim/neovim): Vim-fork focused on extensibility and usability

  > version as high as possible

- [vim-plug](https://github.com/junegunn/vim-plug): 🌺 Minimalist Vim Plugin Manager

- [node.js](https://github.com/nodejs/node): Node.js JavaScript runtime ✨🐢🚀✨

  > version as high as possible

### Option

- [bat](https://github.com/sharkdp/bat): A cat(1) clone with wings.
- [im-select](https://github.com/daipeihust/im-select): Switch your input method from terminal
- [nerd fonts](https://github.com/ryanoasis/nerd-fonts): 🔡 Iconic font aggregator, collection, and patcher. 40+ patched fonts, over 3,600 glyph/icons, includes popular collections such as Font Awesome & fonts
- [fzf](https://github.com/junegunn/fzf): 🌸 A command-line fuzzy finder

## Plugin List

|              Name               |                          Effection                           |
| :-----------------------------: | :----------------------------------------------------------: |
|    sainnhe/gruvbox-material     |                         Color schema                         |
|       mhinz/vim-startify        |                The fancy start screen for Vim                |
|     ryanoasis/vim-devicons      | Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more |
|     vim-airline/vim-airline     |    lean & mean status/tabline for vim that's light as air    |
| vim-airline/vim-airline-themes  |            A collection of themes for vim-airline            |
| nathanaelkane/vim-indent-guides |  A Vim plugin for visually displaying indent levels in code  |
|        junegunn/fzf.vim         |              A command-line fuzzy finder in vim              |
|       machakann/vim-swap        |      A Vim text editor plugin to swap delimited items.       |
|    terryma/vim-expand-region    | Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination. |
|        tpope/vim-repeat         |       enable repeating supported plugin maps with "."        |
|       tpope/vim-surround        |              quoting/parenthesizing made simple              |
|       tpope/vim-fugitive        |        A Git wrapper so awesome, it should be illegal        |
|      sheerun/vim-polyglot       |           A collection of language packs for Vim.            |
|      jiangmiao/auto-pairs       | Vim plugin, insert or delete brackets, parens, quotes in pair |
|      tmhedberg/simpylfold       |              No-BS Python code folding for Vim               |
|     airblade/vim-gitgutter      | A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks. |
|      liuchengxu/vista.vim       |       Viewer & Finder for LSP symbols and tags in Vim        |
|       scrooloose/nerdtree       |               A tree explorer plugin for vim.                |
|    scrooloose/nerdcommenter     |         Vim plugin for intensely orgasmic commenting         |
|   Xuyuanp/nerdtree-git-plugin   |           A plugin of NERDTree showing git status            |
|    terryma/vim-smooth-scroll    |           Make *scrolling* in *Vim* more pleasant            |
|         janko/vim-test          |           Run your *tests* at the speed of thought           |
|       dense-analysis/ale        | Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support |
|       honza/vim-snippets        | vim-snipmate default snippets (Previously snipmate-snippets) |
|        neoclide/coc.nvim        | Intellisense engine for vim8 & neovim, full language server protocol support as VSCode |

## [Coc](https://github.com/neoclide/coc.nvim)

### Extension

- coc-word
- coc-snippets
- coc-prettier
- coc-tsserver
- coc-json

### coc-setting.json

```json
{
  "prettier.eslintIntegration": true,

  "snippets.ultisnips.enable": false,

  "suggest.noselect": false,
  "suggest.completionItemKindLabels": {
    "keyword": "\uf1de",
    "variable": "\ue79b",
    "value": "\uf89f",
    "operator": "\u03a8",
    "function": "\u0192",
    "reference": "\ufa46",
    "constant": "\uf8fe",
    "method": "\uf09a",
    "struct": "\ufb44",
    "class": "\uf0e8",
    "interface": "\uf417",
    "text": "\ue612",
    "enum": "\uf435",
    "enumMember": "\uf02b",
    "module": "\uf40d",
    "color": "\ue22b",
    "property": "\ue624",
    "field": "\uf9be",
    "unit": "\uf475",
    "event": "\ufacd",
    "file": "\uf723",
    "folder": "\uf114",
    "snippet": "\ue60b",
    "typeParameter": "\uf728",
    "default": "\uf29c"
  }
}
```



