filetype plugin on
set nocompatible
set number
set belloff=all


call plug#begin()


Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'LunarWatcher/auto-pairs'
Plug 'maxboisvert/vim-simple-complete'
Plug 'prabirshrestha/vim-lsp'
Plug 'mrk21/yaml-vim'
Plug 'morhetz/gruvbox'
Plug 'itspriddle/vim-shellcheck'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()
nnoremap <C-t> :NERDTreeToggle<CR>
set encoding=UTF-8
set termguicolors
set bg=dark
colorscheme gruvbox
let g:AutoPairsShorcutToggle = '<C-P>'
let vim_markdown_preview_github=1
if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->['bash-language-server', 'start']},
        \ 'allowlist': ['sh', 'bash'],
        \ })
endif
