" File: vimrc
" Author: Adi L. Suryadi
" Credits:
" - https://gist.github.com/rawaludin/89521671393a640d187f
" - https://github.com/junegunn/dotfiles/blob/master/vimrc
" - others

call plug#begin('~/.vim/plugged')

" -----------------------------------------------------------------------------
" Making Vim look good
" -----------------------------------------------------------------------------
Plug 'altercation/vim-colors-solarized'
Plug 'mhinz/vim-janah'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'

" -----------------------------------------------------------------------------
" Vim as a programmer's text editor
" -----------------------------------------------------------------------------
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons' " add icon to nerdtree and airline
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/html5.vim'

" Typescript
" Plug 'clausreinke/typescript-tools.vim', { 'do': 'npm install' }
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak'}

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'

" Languages
Plug 'elixir-lang/vim-elixir'

" -----------------------------------------------------------------------------
" Browsing
" -----------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'rizzatti/dash.vim'

" -----------------------------------------------------------------------------
" Other text editing features
" -----------------------------------------------------------------------------
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'

" -----------------------------------------------------------------------------
" Misc
" -----------------------------------------------------------------------------
" Currently seems to be broken in neovim :(
Plug 'takac/vim-spotifysearch' " control spotify

call plug#end()

" -----------------------------------------------------------------------------
" General settings
" -----------------------------------------------------------------------------
set ruler                 " show the cursor position all the time
set nonumber
set relativenumber
set nowrap
set showcmd               " display incomplete commands
" Tab settings
set expandtab             " Expand tabs into spaces
set tabstop=2             " default to 2 spaces for a hard tab
set softtabstop=2         " default to 2 spaces for the soft tab
set shiftwidth=2          " for when <TAB> is pressed at the beginning of a line
" Fold setings
set foldmethod=indent     " Fold based on indent
set foldnestmax=10        " deepest fold is 10 levels
set nofoldenable          " dont fold by default

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" From old settings
set backspace=start,indent,eol
set autoindent
set incsearch
set laststatus=2
set nobackup
set nowritebackup

" no bell no visual
set noeb vb t_vb=

colorscheme janah

" support true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" different cursor on insert and normal mode (only work for iTerm2)
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" redraw issue after iTerm2 fullscreen + airline.vim
set lazyredraw "draw issue after iTerm2 fullscreen + airline.vim

filetype plugin indent on

" -----------------------------------------------------------------------------
" Custom Keymaps
" -----------------------------------------------------------------------------
" use space as leader key
let mapleader      = ' '
let maplocalleader = ' '

" nerdtree
map <Leader>1 <plug>NERDTreeTabsToggle<CR>

" bufexplorer
map <Leader>2 :ToggleBufExplorer<CR>

" tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>

" previous buffer by [
map ~ :bp<cr>
" next buffer by ]
map ` :bn<cr>

nnoremap / /\v
vnoremap / /\v
" Enter clear previous search highlight
nnoremap <CR> :noh<CR><CR>

" Toggle paste mode by pressing F9
set pastetoggle=<F9>

" Disable CTRL-A on tmux or on screen
if $TERM =~ 'screen'
  nnoremap <C-a> <nop>
  nnoremap <Leader><C-a> <C-a>
endif

" FZF mappings
" -----------------------------------------------------
nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>"

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" -----------------------------------------------------------------------------
" YouCompleteMe
" -----------------------------------------------------------------------------
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_use_ultisnips_completer = 1

" move selection from top to bottom when press tab
" use tab to forward cycle
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Disable IndentLines by default
let g:indentLine_enabled = 0

" -----------------------------------------------------------------------------
" FZF
" -----------------------------------------------------------------------------
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Files] Extra options for fzf
"   e.g. File preview using Highlight
"        (http://www.andre-simon.de/doku/highlight/en/highlight.html)
let g:fzf_files_options =
      \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"   * Preview script requires Ruby
"   * Install Highlight or CodeRay to enable syntax highlighting
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
autocmd VimEnter * command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

" Status line (neovim)
" function! s:fzf_statusline()
"   " Override statusline as you like
"   highlight fzf1 ctermfg=161 ctermbg=251
"   highlight fzf2 ctermfg=23 ctermbg=251
"   highlight fzf3 ctermfg=237 ctermbg=251
"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction
"
" autocmd! User FzfStatusLine call <SID>fzf_statusline()

" -----------------------------------------------------------------------------
" Autoclose preview window, after select
" -----------------------------------------------------------------------------
let g:SuperTabClosePreviewOnPopupClose = 1

" -----------------------------------------------------------------------------
" Enable airline icons
" -----------------------------------------------------------------------------
" air-line
" let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" -----------------------------------------------------------------------------
" Misc settings
" -----------------------------------------------------------------------------
" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" spotify
let g:spotify_country_code = 'ID'

" nerdcommenter
let g:NERDSpaceDelims = 1

" bufexporer
let g:bufExplorerShowRelativePath=1  " Show relative paths.

