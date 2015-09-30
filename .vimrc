" vundle requires this stuff
set nocompatible " no vi compatibility hangups
filetype off

let myhome = $HOME
let vimdir = myhome . "/.vim"
if isdirectory(vimdir)
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  " end - vundle required.  filetype can be reenabled

  " Bundles - start with vundle
  Bundle 'gmarik/vundle'
  Bundle 'scrooloose/nerdtree'
  Bundle 'ctrlpvim/ctrlp.vim'
  Bundle 'scrooloose/syntastic'
  Plugin 'bling/vim-airline'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'bronson/vim-trailing-whitespace'
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'Yggdroot/indentLine'
  Plugin 'justinmk/vim-gtfo'
  Plugin 'tomtom/tcomment_vim'
  Plugin 'rking/ag.vim'
  Plugin 'tpope/vim-fugitive.git'
  Plugin 'tpope/vim-surround.git'
  Plugin 'rsmenon/vim-mathematica'
  Plugin 'Valloric/YouCompleteMe'
  "Plugin 'sjl/gundo.vim'
endif

""""""""""""""""""""""
" General Settings
""""""""""""""""""""""
" Enable a large viminfo file
" 1000 previously edited files, 1000 lines of cmd-line history
set viminfo='1000,f1,:1000,/1000
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
" oops...forgot to sudo.  Use :w!!
cmap w!! w !sudo tee % >/dev/null
" Let backspace delete lots of stuff

set backspace=indent,eol,start

" Highlight matching parens
set showmatch

" autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" highlight current line
set cursorline

" load filetype-specific indent files
filetype on
filetype indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
au! BufNewFile,BufRead *.m set ft=mma sw=2

" enable folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent


" highlight last inserted text
nnoremap gV `[v`]

" use real regex
nnoremap / /\v
vnoremap / /\v

" ex mode meh
nnoremap Q <nop>

" visual autocomplete for command manu
set wildmenu

" these are for line-by-line cursor movement on wrapped lines
:nmap j gj
:nmap k gk
"show linewrap
" set showbreak=↪   "" commented because it requires magic fonts

" navigate windows with ctrl-dir instead of ctrl-w dir
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" tab searches bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" emacs-like command line ability
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" ignore+smartcase lets lc match all but if uc included then exact match
" hlsearch highlights current search ,q will disable the highlight
" incsearch highlights as you type an expression

:set incsearch
:set ignorecase
:set smartcase
:set hlsearch

"" Color stuff
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

syntax on
if isdirectory(vimdir)
  "colorscheme monokai
  "colorscheme mustang
  colorscheme apprentice
  "colorscheme solarized
endif

" highlighting and autocomplete
let g:mma_candy = 1 " pretty chars in mathematica
let g:mma_highlight_option = "solarized"

if filereadable("~/.vim/plugin/setcolors.vim")
  :source ~/.vim/plugin/setcolors.vim
endif

"""""""""""""""""""
"" Leader stuff
"""""""""""""""""""
" set leader as comma (default \)
let mapleader=","
nnoremap <leader>tl :call ToggleNumber()<CR> " toggle line number
nnoremap <leader>s :mksession<CR> " save session - captures multiple windows
nnoremap <leader>a :Ag " open ag.vim
:nmap <leader>l :setlocal number!<CR>
:nmap <leader>o :set paste!<CR>
:nmap <leader>c :set nocursorline<CR>
:nmap <leader>C :set cursorline<CR>
" highlight current line and mark with 'm'
:nmap <leader>m mm:execute 'match Search /\%'.line('.').'l/'<CR>
" highlight current column - doesn't seem to work :(
:nmap <leader>M execute 'match Search /\%'.virtcol('.').'v/'<CR>
" NerdTree
:nmap <leader>N :NERDTreeToggle<CR> " toggle nerdtree visibility
" unhightlight search
:nmap <leader>q :nohlsearch<CR>
"edit/reload vimrc
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>rv :so ~/.vimrc<CR>
" toggle mouse
nmap <leader>tm :call ToggleMouse()<CR>
" strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" select the just-pasted text
nnoremap <leader>sv V` ]
" colorscheme stuff
nmap <Leader>cn <F8>
" Fugitive git leader settings { - SPF13
if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gr :Gread<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>ge :Gedit<CR>
  " Mnemonic _i_nteractive
  nnoremap <silent> <leader>gi :Git add -p %<CR>
  nnoremap <silent> <leader>gg :SignifyToggle<CR>
endif
" }

" toggle gundo - requires python
"nnoremap <leader>u :GundoToggle<CR>

""""""""""""""""""""""""""""""
"" Buffer and Window splits
"" https://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
""""""""""""""""""""""""""""w
" window
nmap <leader>swl  :topleft  vnew<R>
nmap <leader>swh :botright vnew<CR>
nmap <leader>swk    :topleft  new<CR>
nmap <leader>swj  :botright new<CR>
" buffer
nmap <leader>sl   :leftabove  vnew<CR>
nmap <leader>sh  :rightbelow vnew<CR>
nmap <leader>sk     :leftabove  new<CR>
nmap <leader>sj   :rightbelow new<CR>

"""""""" end Buffer """""""""""""""""

" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
" absolute in insert, relative in other modes
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" absolute w/o focus, relative with focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber


" SPF13 Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

"""""""""""""""""""""
"" end leader
"""""""""""""""""""""

" Syntastic recmommended beginner settings
if isdirectory(vimdir)
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  """"""""""""""""""
  "" Seach settings
  "" Ctrl-P settings
  """"""""""""""""""

  " recommended - set starting directory as either nearest ancestor with .git, .svn, etc,
  " or as CWD if otherwise
    let g:ctrlp_working_path_mode = 'ra'
    let g:crtlp_switch_buffer = 0

    " change default mapping and default command to invoke CtrlP
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
  " exclude some files and dirs
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  "let g:ctrlp_custom_ignore = {
  "  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "  \ 'file': '\v\.(exe|so|dll)$',
  "  \ 'link': 'some_bad_symbolic_links',
  "  \ }

  " custom file listing command
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'        " MacOSX/Linux

  "" Airline stuff

  " have it appear all the time
  set laststatus=2
  let g:airline_powerline_fonts=1
  let g:airline_theme             = 'powerlineish'

  if isdirectory(expand("~/.vim/bundle/vim-airline/"))
    if !exists('g:airline_theme')
      let g:airline_theme = 'solarized'
    endif
    if !exists('g:airline_powerline_fonts')
      " Use the default set of separators with a few customizations
      let g:airline_left_sep='›'  " Slightly fancier than '>'
      let g:airline_right_sep='‹' " Slightly fancier than '<'
    endif
  endif
endif

"""""""""""""""""
" indentLine
"""""""""""""""""
let g:indentLine_color_term = 239
let g:indentLine_char = '.'

""""""""""""""""""
" gtfo.vim
" got - open terminal or tmux in current file's cwd
" gof - open in file manager
" goT - open my pwd in term or tmux
" goF - same in file manager
""""""""""""""""""
" force iTerm:
let g:gtfo#terminals = { 'mac' : 'iterm' }

"""""""""""""""""""""
" Restore cursor posisiton
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" includes logic to deal with folded views as well
"""""""""""""""""""""
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

if has("folding")
  function! UnfoldCur()
    if !&foldenable
      return
    endif
    let cl = line(".")
    if cl <= 1
      return
    endif
    let cf  = foldlevel(cl)
    let uf  = foldlevel(cl - 1)
    let min = (cf > uf ? uf : cf)
    if min
      execute "normal!" min . "zo"
      return 1
    endif
  endfunction
endif

augroup resCur
  autocmd!
  if has("folding")
    autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
  else
    autocmd BufWinEnter * call ResCur()
  endif
augroup END

"""""""""" end cursor memory """"""""""""

""""""""""""""""""""""""""""""""""""""""""""""
"" Autogroups
"" http://dougblack.io/words/a-good-vimrc.html
""""""""""""""""""""""""""""""""""""""""""""""
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType php,python,javascript,java,ruby,html autocmd BufWritePre <buffer> StripWhitespace
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

""""""""""""""""""""""""
"" Backups moved to /tmp
"" http://dougblack.io/words/a-good-vimrc.html
""""""""""""""""""""""""
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

""""""""""""""""""""""""
" toggle between number and relativenumber
"" http://dougblack.io/words/a-good-vimrc.html
""""""""""""""""""""""""
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" nvie.com/posts/how-i-boosted-my-vim/
function! ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

" other sources
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
