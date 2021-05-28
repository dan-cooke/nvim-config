set shell=/usr/local/bin/fish
set autochdir

let mapleader = "\<Space>"

set mouse=a
set colorcolumn=100

"" ========================== PLUGINS ======================================= 
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/dag/vim-fish'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'preservim/nerdtree'
Plug 'https://github.com/jistr/vim-nerdtree-tabs'
Plug 'SirVer/ultisnips'
Plug 'https://github.com/airblade/vim-rooter'

call plug#end()



""" =========================== vim rooter ==========================================
let g:rooter_patterns = ['=baggers']


""" =========================== FZF ==========================================
let $FZF_DEFAULT_COMMAND = 'rg --files '


"" JS
let g:javascript_conceal_arrow_function  = "⇒"
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

""" =========================== COC==========================================
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <leader>, <Plug>(coc-codeaction)
nmap <silent> gh :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <leader>rn <Plug>(coc-rename)

""" =========================== Ultisnip ==========================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"





""" =========================== COMMANDS =====================================
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()


""" ========================= THEME =========================================
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

syntax on
colorscheme onedark


"" ============================= GENERAL REMAPS ============================
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy


" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P<Paste>


" " Uppercase word
inoremap <c-u> <esc>gUawA

" " NERDTree
map <leader>n <plug>NERDTreeTabsToggle<CR>


" " Fzf
nnoremap <C-p> :ProjectFiles <CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-Space> :b#<CR>


" Quick Save
nnoremap <C-s> :w<CR>
nnoremap <leader>q :q!<CR>

" " Quick Exit
nnoremap <leader>q :q!<CR>
nnoremap <leader>z ZZ

" " Change words
:nnoremap ,n :exe 'cw' . input('Name: ')<CR>


" VIM prefs"
set noswapfile
set showcmd
set numberwidth=1
set number relativenumber
set hidden

set wildignore+=*node_modules/**

"" python
let g:python3_host_prog="/usr/local/bin/python3"
