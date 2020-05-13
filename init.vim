" Options
set autoindent
set autoread
set background=dark
set completeopt=menu,longest
set conceallevel=2
set emoji
set encoding=UTF-8
set expandtab
set fdo-=search
set foldenable
set foldlevel=64
set foldmethod=syntax
set foldnestmax=32
set visualbell
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
set path+=**
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
set wildignorecase
set wildmenu
set wildmode=full
set wrap

syntax on
filetype indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

if has("gui")
    set showtabline=0
    set guifont="hack:h14"
endif

" Key Mapping
let mapleader = ","
iabbrev gppg MYGPGKEY
inoremap , , 

nnoremap <silent> <leader>vr <cmd>vsplit ~/.config/nvim/init.vim<cr>
tnoremap <silent> <Esc><Esc> <C-\><C-n>
tnoremap <silent> <C-x> <C-c>exit<cr>
nnoremap <silent> <space> za

inoremap <silent> / /<C-x><C-f>

nnoremap <silent> <Backspace><Backspace> "_dd

xnoremap @ :<C-u>call <SID>ExecuteMacroOverVisualRange()<cr>

vnoremap <silent> <C-c> "*y
vnoremap <silent> <C-x> "*d
vnoremap <silent> <Backspace> "_d

nnoremap <silent> <home> ^
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

nnoremap <silent> <C-d> <cmd>resize -4<cr>
nnoremap <silent> <C-f> <cmd>resize +4<cr>
nnoremap <silent> <C-g> <cmd>vertical resize +4<cr>
nnoremap <silent> <C-s> <cmd>vertical resize -4<cr>

nnoremap <tab> <cmd>tabnext<cr>
nnoremap <S-tab> <cmd>tabprevious<cr>

nnoremap <silent> <j> gj
nnoremap <silent> <k> gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

nnoremap <silent> <cr> <cmd>nohlsearch<cr>

nnoremap <silent> co <cmd>copen<cr>
nnoremap <silent> cd <cmd>cclose<cr>

nnoremap <silent> tt <cmd>terminal<cr>

inoremap <silent> <C-t> <C-r>=<SID>Exen("klyiWjpl")<cr><End>
inoremap <expr> <silent> <tab> <SID>CleverTab()
inoremap <expr> <silent> <S-tab> pumvisible() ? '<C-p>' : ''

nnoremap <silent> ss <cmd>update<cr>
nnoremap <silent> <C-z> <cmd>ZoomToggle<cr>

nnoremap <silent> o :<C-u>call <SID>OpenLines(v:count, 0)<cr>i
nnoremap <silent> O :<C-u>call <SID>OpenLines(v:count, -1)<cr>i

nnoremap <silent> te <cmd>call ToggleTerm('$SHELL')<cr>
nnoremap <silent> rn <cmd>set relativenumber!<cr>

" For Nvim LSP feature
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" set omnifunc=v:lua.vim.lsp.omnifunc
" autocmd User lsp_server_init call s:on_lsp_server_init()

" Commands
command! W :w
command! Reload call s:Reload()
command! FixSpaces call s:FixSpaces()
command! ZoomToggle call s:ZoomToggle()
command! ContextPaste call s:ContextPasteToggle()
command! Ss silent! mksession!
command! Sl call s:LoadSession()

" Auto CMD
autocmd TermOpen * startinsert
autocmd TermOpen * setlocal listchars= nonumber norelativenumber

autocmd ColorScheme * highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd InsertLeave,BufRead * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/
autocmd InsertEnter * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+\%#\@<!$/

autocmd CompleteDone * pclose
autocmd CursorMovedI,InsertLeave \* if pumvisible() == 0|silent! pclose|endif
autocmd BufRead,BufNew * silent! ContextPaste
autocmd BufWritePre * call s:Mkdir()
" autocmd InsertLeave * silent! execute("update") Uncomment for autosave

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
function! s:Reload() abort
    let l:file = readfile(expand('%'), 1)
    let l:column = col('.')
    let l:line = line('.')

    let l:results = !setline(1, l:file)
    call cursor(l:line, l:column)

    set nomodified
endfunction

function! s:Mkdir()
    let dir = expand('%:p:h')

    if dir =~ '://'
        return
    endif

    if !isdirectory(dir)
        call mkdir(dir, 'p')
        echo 'Created non-existing directory: ' . dir
    endif
endfunction

function! s:LoadSession()
    if filereadable(expand('%:p:h') . "/Session.vim")
        execute("source Session.vim")
    endif
endfunction

function! s:ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! s:NormalPasta(p, o)
    if (getregtype() ==# "V")
        exe "normal! " . a:o . "\<space>\<bs>\<esc>" . v:count1 . '"' . v:register . ']p'
        " Save the `[ and `] marks (point to the last modification)
        let first = getpos("'[")
        let last  = getpos("']")
        normal! k"_dd
        " Compensate the line we have just deleted
        let first[1] -= 1
        let last[1]  -= 1
        call setpos("'[", first)
        call setpos("']", last)
    else
        exe "normal! " . v:count1 . '"' . v:register . a:p
    endif
endfunction

function! s:VisualPasta()
    if (visualmode() ==# "V")
        if (getregtype() ==# "V")
            exe "normal! gv\"_c\<space>\<bs>\<esc>" . v:count1 . '"' . v:register . ']pk"_dd'
        else
            exe "normal! gv\"_c\<space>\<bs>\<esc>" . v:count1 . '"' . v:register . ']p'
        endif
    else
        " workaround strange Vim behavior (""p is no-op in visual mode)
        let reg = v:register == '"' ? '' : '"' . v:register

        exe "normal! gv" . v:count1 . reg . "p"
    endif
endfunction

function! s:ContextPasteToggle()
    if exists('b:context_paste') && b:context_paste
        let b:context_paste = 0
        nunmap <silent><buffer> P
        nunmap <silent><buffer> p
        xunmap <silent><buffer> p
        xunmap <silent><buffer> P
        echo "Context Paste off"
    else
        let b:context_paste = 1
        nnoremap <silent><buffer> P :<C-U>call <SID>NormalPasta('P', 'O')<cr>
        nnoremap <silent><buffer> p :<C-U>call <SID>NormalPasta('p', 'o')<cr>
        xnoremap <silent><buffer> p :<C-U>call <SID>VisualPasta()<cr>
        xnoremap <silent><buffer> P :<C-U>call <SID>VisualPasta()<cr>
        echo "Context Paste on"
    endif
endfunction

function! s:CleverTab()
    if pumvisible()
        return "\<C-n>"
    endif

    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction

function! s:Exen(command)
    call execute("normal! " . a:command)

    return ''
endfunction

function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
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
    let l:column = col('.')
    let l:line = line('.')

    silent! %s/\s\+$//e
    call cursor(l:line, l:column)
endfunction

function! TabSize()
    if &expandtab
        return &shiftwidth
    else
        return 'Tab'
    endif
endfunction

function! ShowTab()
    let l:tab_level = (indent('.') / &ts )
    if l:tab_level == 0
        let l:tab_level = '*'
    endif
    return l:tab_level
endf

" function! ToggleFlag(option, flag)
"     execute ('let lopt = &' . a:option)
"     if lopt =~ (".*" . a:flag . ".*")
"         execute ('set ' . a:option . '-=' . a:flag)
"     else
"         execute ('set ' . a:option . '+=' . a:flag)
"     endif
" endfunction

function! s:OpenLines(nrlines, dir)
    let l:start = line('.') + a:dir
    call append(l:start, repeat([''], a:nrlines))
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

nnoremap <silent> nn :Lexplore<cr><C-w>l

packadd termdebug
packadd matchit
packadd cfilter

set cscopetag cscopeverbose
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
set cscopetagorder=0
set cscopepathcomp=3

nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

runtime ftplugin/man.vim
set keywordprg=:Man

" Vim-Plug Install
let plug=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(plug)
    !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd * * <Esc>:PlugInstall<cr>:q<cr>
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'Konfekt/FastFold'
    Plug 'RRethy/vim-illuminate'
    Plug 'Yggdroot/indentLine'
    Plug 'airblade/vim-gitgutter'
    Plug 'alvan/vim-closetag'
    Plug 'chaoren/vim-wordmotion'
    Plug 'christoomey/vim-sort-motion'
    Plug 'easymotion/vim-easymotion'
    Plug 'fidian/hexmode'
    Plug 'honza/vim-snippets'
    Plug 'itchyny/lightline.vim'
    Plug 'jacquesbh/vim-showmarks'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf.vim'
    Plug 'lambdalisue/gina.vim'
    Plug 'liuchengxu/vista.vim'
    Plug 'luochen1990/rainbow'
    Plug 'machakann/vim-highlightedyank'
    Plug 'machakann/vim-sandwich'
    Plug 'mattn/emmet-vim'
    Plug 'mbbill/undotree'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'mg979/vim-visual-multi'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'sbdchd/neoformat'
    Plug 'sheerun/vim-polyglot'
    Plug 'sirver/UltiSnips', {'do': ':UpdateRemotePlugins'}
    Plug 'skywind3000/asyncrun.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'wellle/targets.vim'
call plug#end()
" Worth checking
" 'chrisbra/Colorizer'
" 'prabirshrestha/asyncomplete.vim'
" 'ncm2/float-preview.nvim'
" 'kien/rainbow_parentheses.vim'
" 'vim-scripts/Word-Fuzzy-Completion'

" Plugins Configs
" Other
let g:gitgutter_enabled = 1
let g:gitgutter_grep=''
noremap  <leader>f :Neoformat<cr>
let g:neoformat_try_formatprg = 1
command! MakeTags :AsyncRun ctags -R .
command! MakeScope :AsyncRun cscope -Rbq
"normal! DoShowMarks!
let g:rainbow_active = 1
lua require'colorizer'.setup()
let g:float_preview#docked = 0
let g:UltiSnipsExpandTrigger="<C-s>"

" FZF
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let $FZF_DEFAULT_OPTS="--reverse "
nnoremap <C-o> :Rg<cr>
nnoremap <C-p> :Files<cr>
nnoremap <C-u> :Commands<cr>

" Closetag
autocmd BufEnter * :CloseTagDisableBuffer<cr>
nnoremap <leader>ct :CloseTagToggleBuffer<cr>
let g:closetag_filenames = '*.*'

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
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

let g:coc_snippet_next = '<C-s>'
let g:coc_snippet_prev = '<s-tab>'
let g:coc_global_extensions = ['coc-marketplace', 'coc-ultisnips']

" Indent line
let g:indentLine_fileTypeExclude = [
            \'vista_kind',
            \'vista',
            \'terminal',
            \'netrw',
            \]
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indent_guides_auto_colors = 1

" Vista
noremap  <leader>v :Vista<cr>
let g:vista_default_executive = 'coc'
let g:vista_finder_alternative_executives = ['ctags']
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_sidebar_width = 40

" Airline
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'branch', 'readonly', 'filename', 'modified', 'level', 'cocstatus' ]],
            \
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'indent', 'fileformat', 'fileencoding', 'filetype' ]]
            \ },
            \
            \ 'component_function': {
            \   'level': 'ShowTab',
            \   'indent': 'TabSize',
            \   'mode': 'LightlineMode',
            \   'readonly': 'LightlineReadonly',
            \   'branch': 'gina#component#repo#branch'
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
                \ fname ==# 'NetrwTreeListing' ? 'Tree' :
                \ fname ==# 'undotree_2' ? 'Undo' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#filename_modifier = ':t'

" Theme
colorscheme gruvbox
