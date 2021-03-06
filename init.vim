"download plug.vim from here: https://github.com/junegunn/vim-plug
scriptencoding utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8
language en_US

set nocompatible " be iMproved, required
filetype off     " required

""" python ---------------------------------------
let g:python3_host_prog = '/usr/local/bin/python3.10'

""" install plugins with :PlugInstall ------------
call plug#begin('~/.config/nvim/plugged')
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" and moving around
" Plug 'tpope/vim-surround' " Good bye
Plug 'kylechui/nvim-surround'
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
Plug '0xmycf/haskell-vim'
Plug 'alx741/vim-stylishask'
Plug 'godlygeek/tabular'

" fish
Plug 'dag/vim-fish'

" Python
Plug '0xmycf/python-syntax'

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" Kotlin saved for future use
" Plug 'udalov/kotlin-vim'

" Scala
" Plug 'derekwyatt/vim-scala'
" Plug 'scalameta/nvim-metals'

" Java
" Plug 'uiiaoo/java-syntax.vim'

" LaTeX
Plug 'lervag/vimtex'

" Clojure
" Plug 'clojure-vim/clojure.vim'

" JavaScript
Plug 'pangloss/vim-javascript'

" Rust
Plug 'rust-lang/rust.vim'

" CSS inline colors
Plug 'ap/vim-css-color'

" Dart
" Plug 'dart-lang/dart-vim-plugin'

" Svelte
Plug 'evanleck/vim-svelte'

" Zen-Mode
Plug 'Pocco81/TrueZen.nvim'

" Colorschemes
Plug '0xmycf/Spacegray.vim'

" Other gui stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Github Copilot
Plug 'github/copilot.vim'

" misc
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
call plug#end()

""" Sets the appropriate airline theme -----------
source $HOME/.config/nvim/themes/airline.vim

""" LanguageClient idk ---------------------------
" let g:default_julia_version = '1.0'
" language server
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
" \   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
" \       using LanguageServer;
" \       using Pkg;
" \       import StaticLint;
" \       import SymbolServer;
" \       env_path = dirname(Pkg.Types.Context().env.project_file);
" \
" \       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
" \       server.runlinter = true;
" \       run(server);
" \   ']
" \ }

""" Sets the appropriate colorscheme -------------
let g:spacegray_low_contrast    = 1
let g:spacegray_blue_background = 0
let g:spacegray_use_italics     = 0
let g:spacegray_italic_types    = 1
let g:spacegray_italic_keywords = 1
" NOTE: This is my OWN version of spacegray!
colorscheme spacegray

noremap <silent> <C-m> :NERDTreeFocus<CR>
noremap <silent> <C-t> :NERDTreeToggle<CR>
let mapleader = " "
let maplocalleader = " "
map <silent> <C-c> <ESC>

" This is just what the person also had
filetype plugin indent on " required
syntax enable

""" Set a colorcolumn to grey for orientation ----
set colorcolumn=90
hi ColorColumn ctermbg=0 guibg=lightgrey

""" HS Vim Settings ------------------------------
let g:haskell_classic_highlighting = 1

""" Python vim Settings --------------------------
let g:python_syntax_extended_keywords = 1
let g:python_highlight_all = 1

""" Dashboard settings ---------------------------
let g:dashboard_default_executive = 'telescope'
let g:dashboard_session_directory = '~/.config/nvim/session'
" Thanks @Accieo! (github.com/Accieo)
let g:dashboard_custom_header = [
  \'      /`??.??          ',
  \'     /??...??`:??       ',
  \' ??.????  ??   `??.??.????)  ',
  \': ?? ):??;      ??  {   ',
  \' `??.?? `??  ??.????\`????)  ',
  \'     `\\????\??.????      ',
  \]


""" Basic settings -------------------------------
set guifont=MonoLisaRegularNerdFontCompleteMono:13
set termguicolors
set nowrap
set textwidth=0
set tabstop=4 softtabstop=4 shiftwidth=4

" Set tab for md and scala files to 2 spaces
autocmd Filetype markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype scala    setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype haskell setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype tex setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype latex setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype svelte setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Disable italic keywords for rust files
autocmd Filetype rust  hi Keyword cterm=None ctermfg=13 gui=None guifg=#A57A9E

set smarttab
set expandtab
set smartindent
set spelllang=en_gb,de,cjk
set spell
set cursorline
set number relativenumber
set signcolumn=yes:1
set ma

""" Just a precaution ----------------------------
set noswapfile

""" Some Keymaps ---------------------------------

" (de)capitalise the first letter in a word
map mkU viwo<Esc>gUl
map mku viwo<Esc>gul

nmap <Leader>, :<C-u>SessionSave<CR>

" change between buffers
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" buffer navigation
map <silent> <S-l> :bnext<CR>
map <silent> <S-h> :bprevious<CR>

" vscode like moving text around
nnoremap ??   :m .+1<CR>==
nnoremap ???   :m .-2<CR>==
inoremap ??   <Esc>:m .+1<CR>==gi
inoremap ???   <Esc>:m .-2<CR>==gi
vnoremap ??   :m '>+1<CR>gv=gv
vnoremap ???   :m '<-2<CR>gv=gv

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

" Re-sizing splits
nnoremap <silent> <Leader>+         :resize +1<CR>
nnoremap <silent> <Leader>-         :resize -1<CR>
nnoremap <silent> <Leader><Leader>+ :vertical resize +1<CR>
nnoremap <silent> <Leader><Leader>- :vertical resize -1<CR>

" Mappings for easymotion
map  <leader>7 <Plug>(easymotion-sn)
omap <leader>7 <Plug>(easymotion-tn)

" Mappings for clearing the search
noremap <leader>1 :noh<CR>

" Mapping for enabling the zen mode
map <F12> :TZAtaraxis<CR>

" Mapping for Tagbar
nmap <F8> :TagbarToggle<CR>

" Copilot settings
let g:copilot_filetypes = {
      \ 'tex': v:false,
      \ 'latex': v:false,
      \ }

" COC settings
source ~/.config/nvim/mycoc/mycocsettings.vim
" Some nvim-metals specific settings
" source ~/.config/nvim/mycoc/scala.vim

" Vim settings
source ~/.config/nvim/texsettings/texsettings.vim

" Zen settings
source ~/.config/nvim/zen/zenconfig.vim

" snippets
source ~/.config/nvim/snippets/mysnippets.vim

" nvim surround
source ~/.config/nvim/lua/nvim-surround.vim
