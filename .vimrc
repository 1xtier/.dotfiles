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
Plug 'ghifarit53/tokyonight-vim'
Plug 'itspriddle/vim-shellcheck'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

                  
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
let g:AutoPairsShorcutToggle = '<C-P>'

if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->['bash-language-server', 'start']},
        \ 'allowlist': ['sh', 'bash'],
        \ })
endif
