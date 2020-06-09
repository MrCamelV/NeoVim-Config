" Options
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set complete=t,i,.,w,b,u,s,d,U
set completeopt=menu,longest,noinsert,noselect,menuone
set conceallevel=2
set emoji
set encoding=UTF-8
set expandtab
set fdo-=search
set foldenable
set foldlevel=64
set foldmethod=syntax
set foldnestmax=32
set hidden
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set magic
set mouse=a
set nomore
set noshowmode
set number
set numberwidth=1
set pastetoggle=<F2>
set previewheight=7
set pumheight=6
set ruler
set selection=inclusive
set sessionoptions-=options
set shiftround
set shiftwidth=4
set shortmess=a
set showcmd
set showtabline=2
set signcolumn=yes
set smartcase
set smartindent
set smarttab
set softtabstop=4
set spell
set splitbelow
set splitright
set tabpagemax=15
set tabstop=4
set termguicolors
set title
set undolevels=512
set updatetime=512
set viewoptions-=options
set visualbell
set wildignorecase
set wildmenu
set wildmode=full
set wrap

set cscopepathcomp=3
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
set cscopetag cscopeverbose
set cscopetagorder=0

set path=**
set tags+=tags;/

syntax on
filetype indent on
filetype plugin on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" Key Mappings
let mapleader = ","

nnoremap <silent> ;v <cmd>e ~/.config/nvim/init.vim<cr>
tnoremap <silent> <Esc><Esc> <C-\><C-n>
tnoremap <silent> <C-x> <C-c>exit<cr>
nnoremap <silent> <space> za

vnoremap <silent> < <gv
vnoremap <silent> > >gv

inoremap <silent> / /<C-x><C-f>

nnoremap <silent> <Backspace><Backspace> "_dd

xnoremap <silent> @ :<C-u>execute(":'<,'>normal @" . nr2char(getchar()))<cr>
xnoremap <silent> . <cmd>execute("normal .")<cr>

vnoremap <silent> <C-c> "*y
vnoremap <silent> <C-x> "*d
vnoremap <silent> <Backspace> "_d

nnoremap <silent> <home> ^
vnoremap <silent> <home> ^
inoremap <silent> <home> <C-r>=<SID>Exen("^")<cr>

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
tnoremap <silent> <C-h> <C-\><C-N><C-w>h
tnoremap <silent> <C-j> <C-\><C-N><C-w>j
tnoremap <silent> <C-k> <C-\><C-N><C-w>k
tnoremap <silent> <C-l> <C-\><C-N><C-w>l
inoremap <silent> <C-h> <C-\><C-N><C-w>h
inoremap <silent> <C-j> <C-\><C-N><C-w>j
inoremap <silent> <C-k> <C-\><C-N><C-w>k
inoremap <silent> <C-l> <C-\><C-N><C-w>l

nnoremap <silent> <tab> <cmd>tabnext<cr>
nnoremap <silent> <S-tab> <cmd>tabprevious<cr>

nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

nnoremap <silent> <cr> <cmd>nohlsearch<cr>
nnoremap <silent> Q gq

nnoremap <silent> co <cmd>copen<cr>
nnoremap <silent> cd <cmd>cclose<cr>
nnoremap <silent> [q <cmd>execute(v:count1 . "cprevious")<cr>
nnoremap <silent> ]q <cmd>execute(v:count1 . "cnext")<cr>


inoremap <silent> <C-t> <C-r>=<SID>Exen("klyiWjpl")<cr><End>
inoremap <silent> <C-u> <C-g>u<C-u>

inoremap <expr> <silent> <tab> <SID>CleverTab()
inoremap <expr> <silent> <S-tab> pumvisible() ? "<C-p>" : ""

inoremap <silent> <C-space> <C-x><C-o>

nnoremap <silent> ss <cmd>update<cr>
nnoremap <silent> <C-z> <cmd>ZoomToggle<cr>
tnoremap <silent> <C-z> <cmd>ZoomToggle<cr>

nnoremap <silent> o <cmd>call <SID>OpenLines(v:count, 0)<cr>
nnoremap <silent> O <cmd>call <SID>OpenLines(v:count, -1)<cr>

nnoremap <silent> te <cmd>call <SID>OpenTerm("$SHELL")<cr>
nnoremap <silent> tt <cmd>terminal<cr>

nnoremap <silent> rn <cmd>set relativenumber!<cr>

nnoremap <silent> ;r <cmd>call <SID>Reload()<cr>

nnoremap <silent> p p`[v`]=
nnoremap <silent> P P`[v`]=

inoremap <silent> " ""<left>
inoremap <silent> ' ''<left>
inoremap <silent> ( ()<left>
inoremap <silent> [ []<left>
inoremap <silent> ` ``<left>
inoremap <silent> { {}<left>

inoremap <silent> <C-e> <cr><C-o>O

nnoremap <silent> <C-\>c :cs find c <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <C-\>d :cs find d <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <C-\>e :cs find e <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <C-\>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nnoremap <silent> <C-\>g :cs find g <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <C-\>i :cs find i ^<C-R>=expand("<cfile>")<cr>$<cr>
nnoremap <silent> <C-\>s :cs find s <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent> <C-\>t :cs find t <C-R>=expand("<cword>")<cr><cr>

nnoremap <silent> <C-y> :cstag <C-r>=expand("<cword>")<cr><cr>

" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<cr>3jwf>a

" Commands
command! W :w
command! Q :q
command! Ss silent! mksession!
command! Reload call s:Reload()
command! Sl call s:LoadSession()
command! FixSpaces call s:FixSpaces()
command! ZoomToggle call s:ZoomToggle()
command! -nargs=+ -complete=file -bar Grep cgetexpr <SID>Grep(<q-args>)
command! AddPath set path+=$PWD/**
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

" Auto Commands
autocmd TermOpen * setlocal listchars= nonumber norelativenumber
autocmd TermOpen * startinsert
autocmd BufEnter * if &buftype == "terminal" | startinsert | endif

autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
autocmd BufEnter /* call s:LoadCscope()

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=#d65d0e
autocmd InsertLeave,BufRead * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/
autocmd InsertEnter * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+\%#\@<!$/

autocmd CompleteDone * pclose
autocmd CursorMovedI,InsertLeave \* if pumvisible() == 0|silent! pclose|endif
autocmd BufWritePre * call s:Mkdir()
" autocmd InsertLeave * silent! execute("update") Uncomment for autosave
" autocmd TermClose * bwipeout!

" Highlights
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

highlight! LineNr ctermfg=none guibg=none

" Macros
let @i = "G="
let @s = "gsii"
let @w = "\<C-w>="

" Abbreviations
iabbrev fasle false

cnoreabbrev E e
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev W w
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev Wqa wqa

cnoreabbrev DictOn set complete+=k

" Functions
function! s:Reload() abort
    let l:file = readfile(expand("%"), 1)
    let l:column = col(".")
    let l:line = line(".")

    let l:results = !setline(1, l:file)
    call cursor(l:line, l:column)

    set nomodified
endfunction

function! s:Grep(arg)
    let l:grepprg = &grepprg
    if a:arg =~? "^'"
        let l:grepprg .= " --fixed-strings"
    endif

    let l:search = join([l:grepprg, a:arg])
    let l:results = system(l:search)
    if empty(l:results)
        echom "No results for search: " . a:arg
    endif

    return l:results
endfunction

function! s:Mkdir()
    let l:directory = expand("%:p:h")

    if l:directory =~ "://"
        return
    endif

    if !isdirectory(l:directory)
        call mkdir(l:directory, "p")
        echo "Created non-existing directory: " . l:directory
    endif
endfunction

function! s:LoadCscope()
    let l:db = findfile("cscope.out", ".;")
    if (!empty(l:db))
        let l:path = strpart(l:db, 0, match(l:db, "/cscope.out$"))
        set nocscopeverbose
        execute "cs add " . l:db . " " . l:path
        cs reset
        set cscopeverbose
    endif
endfunction

function! s:LoadSession()
    if filereadable(expand("%:p:h") . "/Session.vim")
        execute("source Session.vim")
    endif
endfunction

function! s:CleverTab()
    if pumvisible()
        return "\<C-n>"
    endif

    let l:substr = matchstr(strpart(getline('.'), -1, col('.')+1), "[^ \t]*$")

    if empty(l:substr)
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction

function! s:Exen(command)
    call execute("normal! " . a:command)

    return ""
endfunction

function! s:ZoomToggle() abort
    if exists("t:zoomed") && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction

function! s:FixSpaces()
    let l:column = col(".")
    let l:line = line(".")

    silent! %s/\s\+$//e
    call cursor(l:line, l:column)
endfunction

function! TabSize()
    if &expandtab
        return &shiftwidth
    else
        return "Tab"
    endif
endfunction

function! TabLevel()
    let l:tab_level = (indent(".") / &ts )
    if l:tab_level == 0
        let l:tab_level = "*"
    endif
    return l:tab_level
endf

function! s:OpenLines(nrlines, dir)
    let l:lines = a:nrlines
    if a:nrlines == 0
        let l:lines = 1
    endif

    let l:start = line(".") + a:dir
    call append(l:start, repeat([""], l:lines))
endfunction

function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {"relative": 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

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
    autocmd BufWipeout <buffer> exe "bwipeout ".s:buf
endfunction

function! s:OpenTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        call termopen(a:cmd, { "on_exit": { job_id, code, event -> execute("bwipeout!") }})
    endif
endfunction

" Native Plugins
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_dirhistmax = 0
let g:netrw_liststyle = 3
let g:netrw_silent = 1
let g:netrw_winsize = 25

nnoremap <silent> ;n <cmd>Lexplore<cr>

runtime ftplugin/man.vim
set keywordprg=:Man

packadd! termdebug
packadd! matchit
packadd! cfilter

" For Nvim LSP
" lua require"nvim_lsp".tsserver.setup{}
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<cr>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<cr>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<cr>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<cr>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<cr>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<cr>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<cr>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<cr>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
" set omnifunc=v:lua.vim.lsp.omnifunc
" autocmd User lsp_server_init call s:on_lsp_server_init()

" Vim-Plug Install
let plug=expand("~/.config/nvim/autoload/plug.vim")
if !filereadable(plug)
    !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd * * <Esc>:PlugInstall<cr>:q<cr>
endif

" Plugins
call plug#begin("~/.config/nvim/plugged")
    Plug 'Konfekt/FastFold'
    Plug 'Yggdroot/indentLine'
    Plug 'alvan/vim-closetag'
    Plug 'brooth/far.vim', {'do': ':UpdateRemotePlugins'}
    Plug 'chaoren/vim-wordmotion'
    Plug 'christoomey/vim-sort-motion'
    Plug 'easymotion/vim-easymotion'
    Plug 'haya14busa/vim-asterisk'
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-cursorword'
    Plug 'junegunn/fzf.vim'
    Plug 'kshenoy/vim-signature'
    Plug 'lambdalisue/gina.vim'
    Plug 'liuchengxu/vista.vim'
    Plug 'luochen1990/rainbow'
    Plug 'machakann/vim-highlightedyank'
    Plug 'machakann/vim-sandwich'
    Plug 'mattn/emmet-vim'
    Plug 'mattn/vim-lsp-settings'
    Plug 'mbbill/undotree'
    Plug 'mg979/vim-visual-multi'
    Plug 'mhinz/vim-signify'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'morhetz/gruvbox'
    Plug 'neomake/neomake'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'sbdchd/neoformat'
    Plug 'sheerun/vim-polyglot'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'skywind3000/vim-dict'
    Plug 'stefandtw/quickfix-reflector.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-sleuth'
    Plug 'wellle/targets.vim'
call plug#end()
" Worth checking
" 'chrisbra/Colorizer'
" 'kien/rainbow_parentheses.vim'
" 'vim-scripts/Word-Fuzzy-Completion'
" 'ncm2/float-preview.nvim'

" Plugins Configs
" Other
noremap  <leader>f <cmd>Neoformat<cr>
let g:neoformat_try_formatprg = 1
let g:rainbow_active = 1
lua require"colorizer".setup()
call neomake#configure#automake("rw", 1000)
let g:float_preview#docked = 0

" AsyncRun
let g:asyncrun_auto = "make"
command! MakeTags AsyncRun ctags -R .
command! MakeScope AsyncRun cscope -Rbq
command! -nargs=1 Entr AsyncRun find * | entr -d -r <f-args>

" Asterisk
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1

" FZF
let g:fzf_layout = { "window": "call CreateCenteredFloatingWindow()" }
let $FZF_DEFAULT_OPTS="--reverse "
nnoremap <C-o> <cmd>Rg<cr>
nnoremap <C-p> <cmd>Files<cr>
nnoremap <C-u> <cmd>Commands<cr>
nnoremap <C-q> <cmd>Buffers<cr>

" Closetag
autocmd BufEnter * :CloseTagDisableBuffer<cr>
nnoremap <leader>ct <cmd>CloseTagToggleBuffer<cr>
let g:closetag_filenames = "*.*"

" LSP
let g:lsp_signs_error = {"text": "✗"}
let g:lsp_signs_warning = {"text": ""}
let g:lsp_signs_hint = {"text": "💡"}
let g:lsp_highlights_enabled = 1
let g:lsp_textprop_enabled = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_highlight_references_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand("~/.vim-lsp.log")
highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green
highlight link LspErrorText GruvboxRedSign
highlight link LspHintText GruvboxBlueSign
highlight link LspWarningText GruvboxOrangeSign
set omnifunc=lsp#complete
nnoremap <silent> gh <cmd>LspHover<cr>
nnoremap <silent> <leader>r <cmd>LspRename<cr>
nnoremap <silent> gd <cmd>LspDeclaration<cr>
nnoremap <silent> <C-]> <cmd>LspDefinition<cr>
nnoremap <silent> gD <cmd>LspImplementation<cr>
nnoremap <silent> gr <cmd>LspReferences<cr>
nnoremap <silent> 1gD <cmd>LspTypeDefinition<cr>
nnoremap <silent> cio <cmd>LspCodeAction<cr>

" Indent line
let g:indentLine_fileTypeExclude = [
            \'vista_kind',
            \'vista',
            \'terminal',
            \'netrw',
            \]
let g:indentLine_char_list = ["|", "¦", "┆", "┊"]
let g:indent_guides_auto_colors = 1

" Fast Fold
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" Vista
nnoremap  <leader>v <cmd>Vista<cr>
let g:vista_default_executive = "vim_lsp"
let g:vista_finder_alternative_executives = ["ctags"]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_sidebar_width = 40

" Lightline
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'branch', 'readonly', 'filename', 'modified', 'level', 'lsp', 'neomake' ]],
            \
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'indent', 'fileformat', 'fileencoding', 'filetype' ]]
            \ },
            \
            \ 'component_function': {
            \   'level': 'TabLevel',
            \   'indent': 'TabSize',
            \   'mode': 'LightlineMode',
            \   'readonly': 'LightlineReadonly',
            \   'branch': 'gina#component#repo#branch'
            \ },
            \
            \ 'component_expand': {
            \ 'lsp': 'LspStatus',
            \ 'neomake': 'NeomakeStatus'
            \ },
            \
            \ 'component_type': {
            \ 'lsp': 'right',
            \ },
            \
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

function! LspStatus() abort
    let l:old = lsp#get_buffer_diagnostics_counts()
    let l:new = ""
    if l:old["hint"] > 0
        let l:new = "💡:" . l:old["hint"]
    endif

    if l:old["warning"] > 0
        let l:new = l:new . " :" . l:old["warning"]
    endif

    if l:old["error"] > 0
        let l:new = l:new . " ✗:" . l:old["error"]
    endif

    return l:new
endfunction

function! NeomakeStatus() abort
    let stats = []
    let lcounts = neomake#statusline#LoclistCounts()
    for key in sort(keys(lcounts))
        call add(stats, printf("%s: %d", key, lcounts[key]))
    endfor
    return join(stats, " ")
endfunction

function! LightlineReadonly()
    return &readonly ? "" : ""
endfunction

function! LightlineMode()
    let fname = expand("%:t")
    return fname =~# "^__vista__" ? "Vista" :
                \ fname ==# "NetrwTreeListing" ? "Tree" :
                \ fname ==# "undotree_2" ? "Undo" :
                \ winwidth(0) > 60 ? lightline#mode() : ""
endfunction

" Theme
colorscheme gruvbox
