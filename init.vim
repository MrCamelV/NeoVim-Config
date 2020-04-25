" Variables
set autoindent
set autoread
set completeopt=menu,longest
set encoding=UTF-8
set expandtab
set fdo-=search
set foldlevel=100
set foldmethod=indent
set foldnestmax=20
set hidden
set mouse=a
set nomore
set number
set numberwidth=1
set path+=**
set previewheight=7
set pumheight=6
set shiftwidth=4
set shortmess=a 
set showcmd
set showtabline=2
set signcolumn=yes
set smarttab
set softtabstop=4
set splitbelow
set splitright
set tabpagemax=15
set tabstop=4
set termguicolors
set updatetime=300
set wildignorecase
set wildmenu
set wrap

syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Key Mapping
let mapleader = "-"
iabbrev gppg MYGPGKEY 
inoremap ; ; 
inoremap , , 

nnoremap <silent> <leader>vr :vsplit ~/.config/nvim/init.vim<cr>
tnoremap <silent> <leader><Esc> <C-\><C-n>
tnoremap <silent> <leader>ex <C-c>exit<cr>
nnoremap <silent> <space> za

nnoremap <silent> <C-v> "*p

vnoremap <silent> <C-c> "*y
vnoremap <silent> <C-x> "*d
vnoremap <silent> <Backspace> "_d

inoremap <silent> <C-z> <Esc>ui
nnoremap <silent> <home> ^
inoremap <silent> <home> <Esc>^i

nnoremap <silent> <C-h> <C-w><Left>
nnoremap <silent> <C-j> <C-w><Down>
nnoremap <silent> <C-k> <C-w><Up>
nnoremap <silent> <C-l> <C-w><Right>

nnoremap <silent> <C-d> :resize -4<cr>
nnoremap <silent> <C-f> :resize +4<cr>
nnoremap <silent> <C-g> :vertical resize +4<cr>
nnoremap <silent> <C-s> :vertical resize -4<cr>

nnoremap <silent> <j> gj
nnoremap <silent> <k> gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

noremap! <silent> <C-t> <Esc>klyiWjpa

nnoremap <silent> <Leader>s :update<cr>

command W :w
" command! Reload %d|r|1d
command -nargs=0 R call s:Reload()

nnoremap o :<C-u>call OpenLines(v:count, 0)<cr>S
nnoremap O :<C-u>call OpenLines(v:count, -1)<cr>S

nnoremap <silent> <leader>t :call ToggleTerm('$SHELL')<cr>
nnoremap <silent> rn :set relativenumber!<cr>

" Auto CMD
autocmd TermOpen * startinsert
autocmd TermOpen * setlocal listchars= nonumber norelativenumber

autocmd CompleteDone * pclose

" Highlight
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
highlight! LineNr ctermfg=none guibg=none

" Functions
function s:Reload()
  try
    let filecontents=readfile(expand('%'), 1)
  catch
    return 0
  endtry

  let fclen=len(filecontents)
  if fclen<line('$')
    execute fclen.",$d _"

    undojoin
  endif
  let r=!setline(1, filecontents)
  set nomodified

  return r
endfunction

function ShowTab()
  let TabLevel = (indent('.') / &ts )  
  if TabLevel == 0
    let TabLevel='*'
  endif
  return TabLevel
endf

function ToggleFlag(option,flag)
  exec ('let lopt = &' . a:option)
  if lopt =~ (".*" . a:flag . ".*")
    exec ('set ' . a:option . '-=' . a:flag)
  else
    exec ('set ' . a:option . '+=' . a:flag)
  endif
endfunction

function! OpenLines(nrlines, dir)
  let nrlines = a:nrlines < 3 ? 3 : a:nrlines
  let start = line('.') + a:dir
  call append(start, repeat([''], nrlines))
  if a:dir < 0
    normal! 2k
  else
    normal! 2j
  endif
endfunction

function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    autocmd BufWipeout <buffer> exe 'bwipeout '.s:buf
endfunction

function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
    else
        bwipeout!
    endif
endfunction

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

function! OnTermExit(job_id, code, event) dict
    bwipeout!
endfunction

" Native Plugins
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_dirhistmax = 0
let g:netrw_silent = 1

nnoremap <silent> <leader>ln :Lexplore<cr><C-w>l

packadd termdebug

runtime ftplugin/man.vim
set keywordprg=:Man

" Vim-Plug Install
let plug=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(plug)
    echo "Installing Vim-Plug ..."
    echo ""
    !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd * * <Esc>:PlugInstall<cr>:UpdateRemotePlugins<cr>:q<cr>
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
    " Plug 'phanviet/vim-monokai-pro'
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'Konfekt/FastFold'
    Plug 'RRethy/vim-illuminate'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'Yggdroot/indentLine'
    Plug 'airblade/vim-gitgutter'
    Plug 'alvan/vim-closetag'
    Plug 'b4winckler/vim-angry'
    Plug 'christoomey/vim-sort-motion'
    Plug 'fannheyward/coc-marketplace',  {'do': 'yarn install --frozen-lockfile'}
    Plug 'fidian/hexmode'
    Plug 'honza/vim-snippets'
    Plug 'itchyny/lightline.vim'
    Plug 'jacquesbh/vim-showmarks'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'lambdalisue/gina.vim'
    Plug 'liuchengxu/vista.vim'
    Plug 'luochen1990/rainbow'
    Plug 'machakann/vim-highlightedyank'
    Plug 'mattn/emmet-vim'
    Plug 'mbbill/undotree'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'mhinz/vim-startify'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sbdchd/neoformat'
    Plug 'scrooloose/nerdtree'
    Plug 'sheerun/vim-polyglot'
    Plug 'sirver/UltiSnips'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
call plug#end()
" Worth checking
" 'chrisbra/Colorizer'
" 'ervandew/supertab'
" 'vim-scripts/Word-Fuzzy-Completion'
" 'prabirshrestha/asyncomplete.vim'
" 'othree/vim-autocomplpop'
" 'ncm2/float-preview.nvim'
" 'Shougo/defx.nvim'
" 'lambdalisue/fern.vim'

" Plugins Configs
" NERDTree
	let g:NERDTreeIndicatorMapCustom = {
	    \ "Modified"  : "✹",
	    \ "Staged"    : "✚",
	    \ "Untracked" : "✭",
	    \ "Renamed"   : "➜",
	    \ "Unmerged"  : "═",
	    \ "Deleted"   : "✖",
	    \ "Dirty"     : "✗",
	    \ "Clean"     : "✔︎",
	    \ 'Ignored'   : '☒',
	    \ "Unknown"   : "?"
	    \ }
	let g:NERDTreeFileExtensionHighlightFullName = 1
	let g:NERDTreeExactMatchHighlightFullName = 1
	let g:NERDTreePatternMatchHighlightFullName = 1
	let g:NERDTreeMinimalUI = 1
	let g:NERDTreeDirArrowExpandable = '▷'
	let g:NERDTreeDirArrowCollapsible = '▼'
	let NERDTreeAutoCenter=1
	let NERDChristmasTree=1
	let NERDTreeShowHidden=1

" Devicons
	let g:webdevicons_enable = 1
	let g:webdevicons_enable_airline_tabline = 1
	let g:WebDevIconsUnicodeDecorateFileNodes = 1
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1
	let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
	let g:webdevicons_enable_airline_statusline = 1
	let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
	let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
	let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
	let g:WebDevIconsDefaultFolderOpenSymbol = ''

let g:gitgutter_enabled = 1
let g:gitgutter_grep=''
noremap  <leader>n :NERDTreeToggle<cr> <c-w>l
noremap  <leader>v :Vista<cr>
noremap  <F9> :Goyo<cr>
noremap  <leader>f :Neoformat<cr>
let g:neoformat_try_formatprg = 1
noremap <C-p> <esc>:FZF<cr>
command MakeTags :AsyncRun ctags -R .
nnoremap <leader>ct :CloseTagToggleBuffer<cr>
autocmd BufEnter * :CloseTagDisableBuffer<cr>
nnoremap <leader>st :DoShowMarks!<cr>
let g:closetag_filenames = '*.*'
let g:rainbow_active = 1
let g:startify_bookmarks = [{'Vim': '~/.config/nvim/init.vim'}, {'Zsh': '~/.zshrc'}]
lua require'colorizer'.setup()
let g:float_preview#docked = 0

" COC
	hi CocWarningSign ctermfg=yellow
	hi CocErrorSign ctermfg=red
	hi CocInfoSign ctermfg=blue
	hi CocHintSign ctermfg=brown

	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
    nmap <silent> <leader>r <Plug>(coc-rename)
    nmap <silent> <leader>e <Plug>(coc-refactor)
    nnoremap <silent> gh :call CocAction('doHover')<cr>
    inoremap <silent><expr> <c-space> coc#refresh()

	let g:coc_snippet_next = '<tab>'
	let g:coc_snippet_prev = '<s-tab>'

" Indent lines
	let g:indentLine_fileTypeExclude = [
	      \'startify',
	      \'vista_kind',
	      \'vista',
	      \'terminal', 
          \'fzf', 
          \'netrw', 
	      \]
	let g:indentLine_char_list = ['|', '¦', '┆', '┊']
	let g:indent_guides_auto_colors = 1

" Vista
    let g:vista_default_executive = 'coc'
    let g:vista_finder_alternative_executives = ['ctags']
	let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
    let g:vista#renderer#enable_icon = 1
	let g:vista_sidebar_width = 40

" Airline
	" let g:airline_symbols_branch = ''
	" let g:airline_symbols.linenr = '☰'
	" let g:airline_symbols.linenr = '␊'
	" let g:airline_symbols.linenr = '␤'
	" let g:airline_symbols.linenr = '¶'
	" let g:airline_symbols.maxlinenr = ''
	" let g:airline_symbols.paste = 'ρ'
	" let g:airline_symbols.paste = 'Þ'
	" let g:airline_symbols.paste = '∥'
	" let g:airline_symbols.spell = 'Ꞩ'
	" let g:airline_symbols.notexists = 'Ɇ'
	" let g:airline_symbols.whitespace = 'Ξ'
	" let g:airline_symbols.modified = ' '

    let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'indent', 'cocstatus' ]], 
      \
      \ 'right': [ [ 'lineinfo' ],
	  \            [ 'percent' ],
	  \            [ 'fileformat', 'fileencoding', 'filetype' ]]
      \ },
      \
      \ 'component_function': {
      \   'indent': 'ShowTab', 
      \   'mode': 'LightlineMode',
      \   'readonly': 'LightlineReadonly'
      \ }, 
      \
      \ 'component_expand': {
      \ 'buffers': 'lightline#bufferline#buffers', 
      \ 'cocstatus': 'coc#status'
      \ }, 
      \
      \'component_type': {
      \ 'buffers': 'tabsel', 
      \ 'cocstatus': 'right',
      \ }, 
      \
      \ 'tabline': {
      \     'left': [['buffers']], 'right': [['close']]
      \ }, 
      \
      \ 'separator': { 'left': '', 'right': '' },
	  \ 'subseparator': { 'left': '', 'right': '' }
      \ }

    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

	function! LightlineReadonly()
		return &readonly ? '' : ''
	endfunction

	function! LightlineMode()
	  let fname = expand('%:t')
	  return fname =~# '^__vista__' ? 'Vista' :
	        \ fname ==# 'NERD_tree_1' ? 'Tree' :
	        \ fname ==# 'NetrwTreeListing' ? 'Tree' :
	        \ fname ==# 'undotree_2' ? 'Undo' :
	        \ winwidth(0) > 60 ? lightline#mode() : ''
	endfunction

    let g:lightline#bufferline#enable_devicons = 1
    let g:lightline#bufferline#show_number = 1

" Startify
	let s:header= [
\",---,---,---,---,---,---,---,---,---,---,---,---,---,-------,",
\"|1/2| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | + | ' | <-    |",
\"|---'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-----|",
\"| ->| | Q | W | E | R | T | Y | U | I | O | P | ] | ^ |     |",
\"|-----',--',--',--',--',--',--',--',--',--',--',--',--'|    |",
\"| Caps | A | S | D | F | G | H | J | K | L | \ | [ | * |    |",
\"|----,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'---'----|",
\"|    | < | Z | X | C | V | B | N | M | , | . | - |          |",
\"|----'-,-',--'--,'---'---'---'---'---'---'-,-'---',--,------|",
\"| ctrl |  | alt |                          |altgr |  | ctrl |",
\"'------'  '-----'--------------------------'------'  '------'"
	\]

	let g:startify_change_to_dir = 1
	let g:startify_custom_header = s:center(s:header)

" Theme
colorscheme gruvbox
