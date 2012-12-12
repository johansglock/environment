" Configuration file for vim

" Use Vim defaults instead of 100% vi compatibility
set nocompatible

" Don't parse vim configurations of the file we're editing,
"  this could be a security risk and is just annoying imho.
set nomodeline

" Allow the use of backspace over all characters.
set backspace=indent,eol,start

" Now we set some defaults for the editor 
set autoindent				" Always set autoindenting on
set linebreak				" Don't wrap words by default
set textwidth=0				" Don't wrap lines by default 
set backupcopy=no			" Don't keep annoying backup files
set viminfo='20,\"50		" Read/write a .viminfo file, don't store more than
							" 50 lines of registers
set history=50				" Keep 50 lines of command line history
set ruler					" Show the cursor position all the time
set nowrap					" Disable text wrapping
set showcmd					" Show (partial) command in status line.
set showmatch				" Show matching brackets.
set ignorecase				" Do case insensitive matching
set incsearch				" Incremental search

" Use a column width of 4 for tabs, and always use tabs
"  for indentation
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on

endif " has ("autocmd")
