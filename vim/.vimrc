"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 'nocompatible' to ward off unexpected things that your distro
" might have made, as well as sanely reset options when re-sourcing
" .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and
" possibly its contents. Use this to allow intelligent auto-indenting
" for each filetype, and for plugins that are filetype specific. Enable
" loading the indent file for specific file types.
filetype plugin indent on

" Use 256 colors in Console mode if the terminal supports it
if &term =~? 'mlterm\|xterm'
    set t_Co=256
endif

" Enable syntax highlighting
syntax on

" Automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl
        \ -fLo ~/.vim/autoload/plug.vim
        \ --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install plugins (using the command :PlugInstall)
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" vim-airline plugin related
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usability
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better command-line completion
set wildmenu

" Allow backspacing over autoindent, line breaks and start of insert
" action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you're currently on. Useful for
" READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the
" status line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Do not show the current mode
set noshowmode

" Instead of failing a command because of unsaved changes raise a
" dialogue asking if you wish to save changed files
set confirm

" Enable use of the mouse for all modes
set mouse=a

" Show line numbers
set number

" Change line numbers color
highlight LineNr term=bold cterm=NONE ctermfg=235 ctermbg=NONE gui=NONE guifg=gray22 guibg=NONE

" Configure which whitespace characters to show
set listchars=eol:¶,tab:»·,trail:·,extends:>,precedes:<,space:·

" Show whitespace characters
set list

" Set whitespace characters color
highlight SpecialKey cterm=NONE ctermfg=235 ctermbg=NONE gui=NONE guifg=gray22 guibg=NONE
highlight NonText cterm=NONE ctermfg=235 ctermbg=NONE gui=NONE guifg=gray22 guibg=NONE

" Use <F9> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F9>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show existing tab with 4 spaces width
set softtabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use indent folding
set foldmethod=indent

" Disable folding by default
set nofoldenable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Normal mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete previous word (<A-P>)
nmap p i<C-W><Esc>

" Delete next word (<A-N>)
nmap n daw

" Delete current line
nmap <C-D> dd

" Duplicate current line
nmap <S-D> yyp

" Insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete previous word (<A-P>)
imap p <C-W>

" Delete next word (<A-N>)
imap n <Esc>dawi

" Delete current line
imap <C-D> dd

" Duplicate current line
imap <S-D> yyp

