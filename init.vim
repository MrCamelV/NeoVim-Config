" Variables
set number
set numberwidth=1
set wrap
set encoding=UTF-8
set termguicolors
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hidden
set updatetime=300
set foldmethod=indent
set foldlevel=3
set foldnestmax=20

" Key Mapping
let mapleader = "-"
iabbrev gppg MYGPGKEY 
inoremap ; ; 
inoremap , , 
nnoremap <leader>q viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>vr :vsplit ~/.config/nvim/init.vim<cr>
tnoremap <leader><Esc> <C-\><C-n>
nnoremap <space> za

noremap <C-c> "*y
noremap <C-v> "*p
noremap <C-x> "*d
noremap <Backspace> _d
inoremap <C-z> <Esc>ui

nnoremap <silent> <leader>d :call ToggleTerm('lazydocker')<cr>
nnoremap <silent> <leader>t :call ToggleTerm('$SHELL')<cr>

" Auto CMD
autocmd BufRead,BufWritePre *.html,*.xml :normal gg=G
autocmd BufNewFile * :write
autocmd TermOpen * startinsert
autocmd TermOpen * setlocal listchars= nonumber norelativenumber

" Vim-Plug Install
let plug=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(plug)
    echo "Installing Vim-Plug ..."
    echo ""
    !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd * * :PlugInstall<cr>:UpdateRemotePlugins<cr>:q<cr>
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'phanviet/vim-monokai-pro'
    "Plug 'Erichain/vim-monokai-pro'
    Plug 'skywind3000/asyncrun.vim'
    "Plug 'fholgado/minibufexpl.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'Konfekt/FastFold'
    Plug 'mbbill/undotree'
    Plug 'alvan/vim-closetag'
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'jiangmiao/auto-pairs'
    Plug 'jacquesbh/vim-showmarks'
    Plug 'scrooloose/nerdtree'
    " Plug 'svermeulen/nvim-moonmaker'
    Plug 'lambdalisue/gina.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'honza/vim-snippets'
    Plug 'machakann/vim-sandwich'
    Plug 'sbdchd/neoformat'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " Plug 'junegunn/vim-emoji'
    Plug 'sheerun/vim-polyglot'
    " Plug 'Vigemus/nvimux' 
    Plug 'liuchengxu/vista.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'SirVer/ultisnips'
    " Plug 'lervag/vimtex'
    Plug 'junegunn/goyo.vim'
    " Plug 'Shougo/denite.nvim'
    Plug 'mhinz/vim-startify'
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc-emmet',  {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-yank',  {'do': 'yarn install --frozen-lockfile'}
    Plug 'fannheyward/coc-marketplace',  {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-lists',  {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-highlight',  {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-snippets',  {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "{'do' : 'UpdateRemotePlugins'}
call plug#end()
packadd termdebug

" Functions
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
        call termopen(a:cmd)
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

function LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <silent> gh :call LanguageClient#textDocument_hover()<cr>
        nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
        nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<cr>

        set completefunc=LanguageClient#complete
        set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
    endif
endfunction

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

" COC
	hi CocWarningSign ctermfg=yellow
	hi CocErrorSign ctermfg=red
	hi CocInfoSign ctermfg=blue
	hi CocHintSign ctermfg=brown

	" Brighter line numbers
	hi! LineNr ctermfg=none guibg=none

	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
    nmap <silent> <leader>r <Plug>(coc-rename)
    nmap <silent> <leader>e <Plug>(coc-refactor)
    nnoremap <silent> gh :call CocAction('doHover')<cr>

	let g:coc_snippet_next = '<tab>'
	let g:coc_snippet_prev = '<s-tab>'

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
nmap  <leader>f :Neoformat<cr>
nnoremap <F5> :%!xxd<cr>:set ft=xxd<cr>
nnoremap <F4> :%!xxd -r<cr>
noremap  <F1> :DoShowMarks<cr>
noremap <C-p> <esc>:FZF<cr>
nnoremap <leader>ct :CloseTagToggleBuffer<cr>
autocmd BufEnter * :CloseTagDisableBuffer<cr>
let g:closetag_filenames = '*.*'
let g:startify_bookmarks = [{'Vim': '~/.config/nvim/init.vim'}, {'Zsh': '~/.zshrc'}]
let g:UltiSnipsExpandTrigger="<tab>"
" let g:LanguageClient_autoStart = 1
" autocmd FileType * call LC_maps()

"lua require('nvimux').bootstrap()

" Indent lines
	let g:indentLine_fileTypeExclude = [
	      \'markdown',
	      \'denite',
	      \'startify',
	      \'tagbar',
	      \'vista_kind',
	      \'vista',
	      \'terminal'
	      \]
	let g:indentLine_char_list = ['|', '¦', '┆', '┊']
	let g:indent_guides_auto_colors = 1

" Vista
	let g:vista_executive_for = {'c': 'coc'}
	let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
	let g:vista#renderer#enable_icon = 1
	let g:vista_sidebar_width = 50

" Airline
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}

	let g:airline_powerline_fonts = 1
	let g:airline_symbols = {}
	let g:airline_skip_empty_sections = 1
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols_branch = ''
	let g:airline_powerline_fonts = 1
	let g:airline_symbols.crypt = ''
	let g:airline_symbols.linenr = '☰'
	let g:airline_symbols.linenr = '␊'
	let g:airline_symbols.linenr = '␤'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.maxlinenr = ''
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.paste = '∥'
	let g:airline_symbols.spell = 'Ꞩ'
	let g:airline_symbols.notexists = 'Ɇ'
	let g:airline_symbols.whitespace = 'Ξ'
	let g:airline_symbols.modified = ' '
	let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
	let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
	"extensions
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#coc#enabled = 1
	let g:airline#extensions#unicode#enabled = 1
	let g:airline#extensions#branch#enabled = 1
	let g:airline#extensions#vista#enabled = 1
	let g:airline#extensions#hunks#enabled = 1
	"extension settings
	let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
	let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
	let airline#extensions#coc#warning_symbol = ':'
	let airline#extensions#coc#error_symbol = ':'
	let g:airline#extensions#hunks#hunk_symbols = [':', ':', ':']
	let g:airline#extensions#branch#format = 2


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
let g:rehash256 = 1
colorscheme monokai_pro
let g:airline_theme = 'base16_monokai'
