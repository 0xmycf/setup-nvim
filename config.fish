if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH $PATH "/Users/mycf/.ghcup/bin" "/Users/mycf/.cabal/bin" $HOME "/usr/local/bin"

function hsnew
    stack new $argv https://raw.githubusercontent.com/0xmycf/haskell-template/main/mycftmp.hsfiles
end

abbr -a pgdiff          'git diff --output=./changes.diff'
abbr -a ghc             'stack ghc'
abbr -a ghci            'stack ghci'
abbr -a cc              'cd && clear'
abbr -a vim             'nvim'
abbr -a vom             'nvim'
abbr -a initvim         'vim ~/.config/nvim/init.vim'
abbr -a grep            'ggrep -P'
abbr -a ls              'ls -GF'
abbr -a exa             'exa -l --icons --colour=never'
abbr -a wordle          'https://wordle.at'

# private bindings
source ~/.config/fish/private.fish

set -gx EDITOR "/usr/local/bin/nvim"
set -gx PYTHONPATH "$PYTHONPATH:/usr/local/lib/python3.9/site-packages:/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages"

# Vim!
fish_vi_key_bindings
bind -M insert \cc 'set fish_bind_mode default; commandline -f repaint'
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
