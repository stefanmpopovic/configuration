set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set exrc
set guicursor=
set nu
set noerrorbells
set nowrap
set incsearch
set nohlsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set updatetime=1000

filetype plugin on
syntax on
runtime! archlinux.vim

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none
let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>c :s/\(.*\)/\/\/\1/<CR>
nnoremap <leader>x :s/\/\/\(.*\)/\1/<CR>
vnoremap <leader>c :s/\(.*\)/\/\/\1/<CR>
vnoremap <leader>x :s/\/\/\(.*\)/\1/<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup AUTO
    autocmd!
    autocm BufWritePre * :call TrimWhitespace()
augroup END

" For coc JS server - :CocInstall coc-tsserver
" For coc Java server - :CocInstall coc-java
