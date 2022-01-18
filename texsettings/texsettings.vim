" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'okular'
let g:vimtex_view_skim_activate = 1
let g:vimtex_compiler_latexmk = {
        \ 'build_dir'  : './out',
        \ 'callback'   : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-xelatex',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
map <leader>lv <plug>(vimtex-view)

