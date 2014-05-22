" Configuration file for vim

" Use Vim defaults instead of 100% vi compatibility
set nocompatible

" Don't parse vim configurations of the file we're editing,
"  this could be a security risk and is just annoying imho.
set nomodeline

" Allow the use of backspace over all characters.
set backspace=indent,eol,start

" Now we set some defaults for the editor
set autoindent              " Always set autoindenting on
set shiftround              " Indent/outdent to nearest tabstop
set linebreak               " Don't wrap words by default
set textwidth=0             " Don't wrap lines by default
set nobackup                " Don't keep backup files
set noswapfile              " Don't keep filse like bla.swp
set nowritebackup           " Don't keep files like bla~
set viminfo='20,\"50        " Read/write a .viminfo file, don't store more than
                            " 50 lines of registers
set history=50              " Keep 50 lines of command line history
set ruler                   " Show the cursor position all the time
set nowrap                  " Disable text wrapping
set showcmd                 " Show (partial) command in status line.
set ignorecase              " Do case insensitive matching
set incsearch               " Incremental search
set pastetoggle=<F12>       " Use F12 to quickly switch paste mode
set mouse=v                 " Enable the mouse in visual mode

" Use a column width of 4 for tabs, and expand tabs into spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" We are using diffent pre/post hooks on action keys. For some like
" InsertLeave or InsertEnter there is a key delay from <Esc>. We are disabling
" the timeouts to prevent these delays from taking place.
set timeout timeoutlen=0 ttimeoutlen=-1

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Enable syntax highlighing
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

if has("autocmd")
    " Enabled file type detection
    filetype plugin on

endif " has ("autocmd")

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif

    " UTF-8 rockz, it's as simple as that :)
    set encoding=utf-8
    setglobal fileencoding=utf-8

endif

" Show tabs in a highlighted form
set listchars=tab:>-
set list

" Default highligthing style of errors
highlight ErrorMsg ctermbg=red guibg=red

" Highlight the current line
set cursorline
highlight CursorLine cterm=NONE ctermbg=235 guibg=#262626

" Mark trailing whitespace red except when we're in insert mode.
"  (It's just freaking annoying to see a red flashing background
"   all the time.)
highlight default link TrailingWhitespace ErrorMsg
match TrailingWhitespace /\s\+$/
autocmd InsertEnter * hi link TrailingWhitespace NONE
autocmd InsertLeave * hi link TrailingWhitespace ErrorMsg

" Run pathogen (module loader)
execute pathogen#infect()

" Do automatic indenting based on filetypes (plugin specific indenting)
filetype indent on

" Remap Tab and shift-tab to (un)indent the visual selection
"   (gv keeps visual mode in place)
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Remap Ctrl+A/E to Home/End
map <C-a> <Home>
map <C-e> <End>

" Do the same for insert mode
inoremap <C-a> <Home>
inoremap <C-e> <End>
