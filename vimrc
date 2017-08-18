set autoindent
set smartindent
set expandtab
set softtabstop=3
set shiftwidth=3
set noswapfile
set nobackup
set mouse=a
if has("clipboard")
  set clipboard+=unnamed " copy to the system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
set backspace=indent,eol,start
set pastetoggle=<leader>p
highlight ColorColumn ctermbg=1
syntax enable

" GUI Options
set guifont=Ubuntu\ Mono:h12
set guioptions-=T

" REMOVE TRAILING WHITESPACE ON SAVE
autocmd BufWritePre * :%s/\s\+$//e

" PLUGIN SETUP
" load plug
if has("win32")
   call plug#begin('~/vimfiles/plugged')
else
   call plug#begin('~/.vim/plugged')
endif

Plug 'VundleVim/Vundle.vim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'posva/vim-vue'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Syntax Files
Plug 'phalkunz/vim-ss'
Plug 'ericpruitt/tmux.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'alunny/pegjs-vim'
Plug 'posva/vim-vue'
Plug 'plasticboy/vim-markdown'

" Color Schemes
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()
" END PLUGIN SETUP

" IGNORE DIRECTORIES FOR ctrlp AND OTHERS
set wildignore+=*/.git/*,*/node_modules/*,*/DS_STORE/*,*/coverage/*,*.swp

" NERDTree setup
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" KEY MAPPINGS
nmap ,f :CtrlP<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-t> :tab sp<CR>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
inoremap ii <esc>
noremap # :set invnumber<CR>
map <leader>\ gcc
" END KEY MAPPINGS

" COLORSCHEME
set background=dark
colorscheme jellybeans
" END COLORSCHEME

let g:SuperTabDefaultCompletionType = "context"
let g:jsx_ext_required = 0
let g:vim_markdown_folding_disabled = 1

if has("win32") && !has("gui_running")
   " windows console doesn't look good with gruvbox because it's 16 colors
   set background=dark
   colorscheme desert
elseif has("termguicolors")
   set termguicolors
endif

if &term =~ '256color'
   " disable Background Color Erase (BCE) so that color schemes
   " render properly when inside 256-color tmux and GNU screen.
   " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
   set t_ut=
endif

" Set line wrapping for comments to 90 characters
fun! AdjustWrapForLine()
   if !exists('s:lastLine') || line('.') != s:lastLine
      let s:lastLine = line(".")
      let matched = matchstr(getline('.'), '^\s*\/\=\(\*\|\/\)')

      if !empty(matched)
         set textwidth=90
         set colorcolumn=90
      else
         set textwidth=140
         set colorcolumn=140
      endif
   endif
endfun
augroup JSLineWrap
   autocmd FileType javascript
      \ autocmd! JSLineWrap CursorMoved * call AdjustWrapForLine()
augroup END
" End of line wrapping config

" Increase length of commit summary guide
fun! AdjustGitCommitSummary()
   syn clear gitcommitSummary
   syn match gitcommitSummary "^.\{0,69\}" contained containedin=gitcommitFirstLine nextgroup=gitcommitOverflow contains=@Spell
endfun
autocmd FileType gitcommit call AdjustGitCommitSummary()
" End of commit summary guide
