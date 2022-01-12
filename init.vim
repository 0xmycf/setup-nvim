"download plug.vim from here: https://github.com/junegunn/vim-plug
scriptencoding utf-8
set fileencoding=utf-8
set encoding=utf-8
language en_US

set nocompatible " be iMproved, required
filetype off     " required

""" install plugins with :PlugInstall ------------
call plug#begin('~/.config/nvim/plugged')
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" and moving around
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi'

" File management
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'glepnir/dashboard-nvim'
Plug 'preservim/tagbar'

" fuzzy finder
" old: Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSP support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" HS
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-stylishask'
Plug 'godlygeek/tabular'

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" Kotlin saved for future use
Plug 'udalov/kotlin-vim'

" Scala
Plug 'derekwyatt/vim-scala'

" Java
Plug 'uiiaoo/java-syntax.vim'

" LaTeX
Plug 'lervag/vimtex'

" Colorschemes
Plug 'wojciechkepka/vim-github-dark'
Plug '0xmycf/Spacegray.vim'
Plug 'davidklsn/vim-sialoquent'

" Other gui stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" misc
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
call plug#end()

""" Sets the appropriate airline theme -----------
source $HOME/.config/nvim/themes/airline.vim

""" Sets the appropriate colorscheme -------------
" NOTE: technically these settings are on by default for my version!
let g:spacegray_low_contrast = 1
let g:spacegray_use_italics  = 1
" NOTE: This is my OWN verison of spacegray!
colorscheme spacegray

map <silent> <C-m> :NERDTreeFocus<CR>
map <silent> <C-t> :NERDTreeToggle<CR>
let mapleader = " "
let maplocalleader = " "
map <silent> <C-c> <ESC>

" This is just what the person also had
filetype plugin indent on " required
syntax on

""" Set a colorcolumn to grey for orientation ----
" set colorcolumn=80
" hi ColorColumn ctermbg=0 guibg=lightgrey

""" HS Vim Settings ------------------------------
let g:haskell_classic_highlighting = 1

""" Dashboard settings ---------------------------
let g:dashboard_default_executive = 'telescope'
let g:dashboard_session_directory = '~/.config/nvim/session'
" Thanks @Accieo! (github.com/Accieo)
let g:dashboard_custom_header = [
  \'      /`á.ü          ',
  \'     /ü...ü`:á       ',
  \' ü.á«  ü   `á.ü.á«)  ',
  \': © ):«;      ü  {   ',
  \' `á.ü `á  ü.á«\`áü)  ',
  \'     `\\««\ü.á«      ',
  \]

" Some keybindings
 nmap <Leader>, :<C-u>SessionSave<CR>

""" Basic settings -------------------------------
set guifont=MonoLisaRegularNerdFontCompleteMono:13
set termguicolors
set nowrap
set textwidth=0
set tabstop=4 softtabstop=4 shiftwidth=4
set smarttab
set expandtab
set smartindent
set spelllang=en,de
set cursorline
set number relativenumber
set signcolumn=yes:1
set ma

""" Just a precaution ----------------------------
set noswapfile

""" Some Keymaps ---------------------------------

" change between buffers
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" buffer navigation
map <silent> <S-h> :bnext<CR>
map <silent> <S-l> :bprevious<CR>

" vscode like moving text around
nnoremap º   :m .+1<CR>==
nnoremap ∆   :m .-2<CR>==
inoremap º   <Esc>:m .+1<CR>==gi
inoremap ∆   <Esc>:m .-2<CR>==gi
vnoremap º   :m '>+1<CR>gv=gv
vnoremap ∆   :m '<-2<CR>gv=gv

" Old Mappings
" nnoremap <M-j> :m .+1<CR>==
" nnoremap <M-k> :m .-2<CR>==
" inoremap <M-j> <Esc>:m .+1<CR>==gi
" inoremap <M-k> <Esc>:m .-2<CR>==gi
" vnoremap <M-j> :m '>+1<CR>gv=gv
" vnoremap <M-k> :m '<-2<CR>gv=gv

" tab navigation
nnoremap <TAB>   :tabnext<CR>
nnoremap <C-TAB> :tabprevious<CR>

" telescope settings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Mapping to get out of terminal mode without killing it
tnoremap <Esc> <C-\><C-n>

" resizing splits
nnoremap <silent> <Leader>+         :resize +1<CR>
nnoremap <silent> <Leader>-         :resize -1<CR>
nnoremap <silent> <Leader><Leader>+ :vertical resize +1<CR>
nnoremap <silent> <Leader><Leader>- :vertical resize -1<CR>

" Mappings for easymotion
map  <leader>7 <Plug>(easymotion-sn)
omap <leader>7 <Plug>(easymotion-tn)

" Mappings for clearing the search
noremap <leader>1 :noh<CR>

" COC settings
source ~/.config/nvim/mycoc/mycocsettings.vim

" Vim settings
source ~/.config/nvim/texsettings/texsettings.vim

