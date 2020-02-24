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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'veloce/vim-aldmeris'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'itchyny/lightline.vim'

" -----------------------------------------------------------------------------
" Vim as a programmer's text editor
" -----------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'craigemery/vim-autotag'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'rizzatti/dash.vim'
Plug 'wesQ3/vim-windowswap' " swap between window while maintaining layout
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Languages pack for vim  
" Plug 'sheerun/vim-polyglot'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
"Javascript
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/html5.vim'

" CSS 3
Plug 'hail2u/vim-css3-syntax'
"
" Typescript
Plug 'leafgarland/typescript-vim'

" MDX files
Plug 'jxnblk/vim-mdx-js'

" -----------------------------------------------------------------------------
" Other text editing features
" -----------------------------------------------------------------------------
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'adelarsq/vim-matchit'
Plug 'dhruvasagar/vim-zoom'

" -----------------------------------------------------------------------------
" Misc
" -----------------------------------------------------------------------------
Plug 'christoomey/vim-tmux-navigator' " navigate through vim window/tmux panes using same <C-h/j/k/l> keys
Plug 'dyng/ctrlsf.vim'

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
set hlsearch
set incsearch
set laststatus=2
set nobackup
set nowritebackup
set noswapfile

" no bell no visual
set noeb vb t_vb=

syntax on
colorscheme vim-monokai-tasty

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

" tagbar
nmap <F8> :TagbarToggle<CR>

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

map <leader>q :q<cr>
map <leader>w :write<cr>
map <leader>s :split<cr>
map <leader>v :vsplit<cr>

map <leader>cp   :set clipboard=unnamed<cr>
map <leader>cpu  :set clipboard=<cr>
map <leader>cup  :set clipboard=<cr>
map <leader>noclip  :set clipboard=<cr>
map <leader>clipboard    :set clipboard=unnamed<cr>
map <leader>noclipboard  :set clipboard=<cr>

nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

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

" Vim Tmux Navigator
" navigate through vim window/tmux panes using same <C-h/j/k/l> keys
" Workaround when <C-h> now working in nvim + iterm combination
if has('nvim')
    nmap <BS> :<C-u>TmuxNavigateLeft<CR>
else
    nmap <C-h> <C-w>h
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
nnoremap <silent> <Leader>r        :BTags<CR>
nnoremap <silent> <Leader>l        :BLines<CR>
nnoremap <silent> <Leader>f        :BLines<CR>
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

" move selection from top to bottom when press tab
" use tab to forward cycle
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

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

" Automatically update tag file upon save
let g:autotagTagsFile='tags'

" -----------------------------------------------------------------------------
" Autoclose preview window, after select
" -----------------------------------------------------------------------------
let g:SuperTabClosePreviewOnPopupClose = 1


" Switch between dark and light mode by pressing F5
" call togglebg#map("<F5>")

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
" Lightline config
" -----------------------------------------------------------------------------
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction


" -----------------------------------------------------------------------------
" Python specific settings
" -----------------------------------------------------------------------------
let python_highlight_all=1

" Python Indentation
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

" Flagging Unnecessary Whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" -----------------------------------------------------------------------------
" Find files
" -----------------------------------------------------------------------------
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Misc settings
" -----------------------------------------------------------------------------
" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" nerdcommenter
let g:NERDSpaceDelims = 1

" bufexporer
let g:bufExplorerShowRelativePath=1  " Show relative paths.

" Hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree"

set encoding=utf-8

" disable conceal for hiding quote marks in JSON
set conceallevel=0

set cursorline

" https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  " Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" http://vim.wikia.com/wiki/Maximize_window_and_return_to_previous_split_structure
function! OpenCurrentAsNewTab()
  let l:currentPos = getcurpos()
  tabedit %
  call setpos(".", l:currentPos)
endfunction
nmap to :call OpenCurrentAsNewTab()<CR>
nmap <C-W>z :call zoom#toggle()<CR>

" To disable scanning of all included files
set complete-=i

" Dash doc
nnoremap <leader>d :Dash<cr>

" CSS 3 Highlighting hack
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-git', 'coc-stylelint']
" == AUTOCMD ================================
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================
