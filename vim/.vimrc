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
Plug 'aacunningham/vim-fuzzy-stash'     " Requires: fzf
Plug 'chrisbra/vim-diff-enhanced'
Plug '~/.fzf'                           " Assumption: Installed as per https://github.com/junegunn/fzf#using-git
Plug 'junegunn/fzf.vim'                 " Requires: ag (see https://github.com/ggreer/the_silver_searcher)
Plug 'ludovicchabant/vim-gutentags'
Plug 'SirVer/UltiSnips'                 " Requires: vim with python support
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'           " Requires: vim with python support and building ycm
                                        " (see https://github.com/Valloric/YouCompleteMe#installation for details)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Conque-GDB'
Plug 'w0rp/ale'
call plug#end()

" ale plugin related
let g:ale_linters_explicit=1
let g:ale_sign_column_always=0
let g:ale_change_sign_column_color=0

" UltiSnips plugin related
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME . '/.vim/snips']

" vim-airline plugin related
" Assumption: Patched powerline fonts are installed on this machine
"             (e.g. using `sudo apt-get install fonts-powerline`).
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

" Customize airline statusline sections
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z='%l/%L : %v'
let g:airline_skip_empty_sections=1

" Use abbreviated modes in the airline statusline
let g:airline_mode_map={
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ 't'  : 'T',
\ }

" vim-diff-enhanced related
if &diff
    " Change colors
    highlight DiffAdd    cterm=NONE ctermfg=NONE ctermbg=22  gui=NONE guifg=bg guibg=NONE
    highlight DiffDelete cterm=NONE ctermfg=NONE ctermbg=52  gui=NONE guifg=bg guibg=NONE
    highlight DiffChange cterm=NONE ctermfg=NONE ctermbg=237 gui=NONE guifg=bg guibg=NONE
    highlight DiffText   cterm=NONE ctermfg=15   ctermbg=58  gui=NONE guifg=bg guibg=NONE

    " Use the "myers" algorithm for diffs
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=myers")'
endif

" vim-gutentags plugin related
" Assumption: '--fields=+l' is present in the ~/.ctags file
let g:gutentags_cache_dir='~/.gutentags'
let g:gutentags_ctags_tagfile='tags'
let g:gutentags_ctags_exclude=['*/.scons/*', '*/.travis/*', '*/bin/*', '*/build/*', '*/deploy/*']
let g:gutentags_generate_on_write=0

" YouCompleteMe plugin related
set completeopt-=preview
let g:ycm_max_num_identifier_candidates=5
let g:ycm_max_num_candidates=5
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_goto_buffer_command='same-buffer'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usability
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set output encoding of files displayed in terminal and/or written to
" disk to UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Do not wait for a key code or mapped key sequence to complete
set timeoutlen=1000
set ttimeoutlen=0

" Better command-line completion
set wildmenu

" Hide buffers containing changes rather than closing them
set hidden

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

" Show line numbers
set number

" Change line numbers color
highlight LineNr term=bold cterm=NONE ctermfg=235 ctermbg=NONE gui=NONE guifg=gray22 guibg=NONE

" Highlight current line
set cursorline

" Set current line colors
highlight CursorLine ctermbg=NONE cterm=NONE

" Set sign column color
highlight SignColumn ctermbg=NONE ctermfg=0 cterm=NONE gui=NONE guifg=black guibg=NONE

" Print line margin
let &colorcolumn=121

" Set print line margin color
highlight ColorColumn ctermbg=235

" Configure which whitespace characters to show
set listchars=eol:¶,tab:»-,trail:·,extends:>,precedes:<

" Show whitespace characters
set list

" Set whitespace characters color
highlight SpecialKey cterm=NONE ctermfg=235 ctermbg=NONE gui=NONE guifg=gray22 guibg=NONE
highlight NonText    cterm=NONE ctermfg=235 ctermbg=NONE gui=NONE guifg=gray22 guibg=NONE

" Use <F9> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F9>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show existing tab with 4 spaces width
set softtabstop=4
set tabstop=4

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

" fzf related
nnoremap <C-b> :Windows<CR>
nnoremap <C-f> :BLines<CR>
nnoremap <C-h> :Ag<CR>
nnoremap <C-p> :Files<CR>

" YouCompleteMe related
nnoremap <F3> :YcmCompleter GoTo<CR>
