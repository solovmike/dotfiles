" Add numbers to each line on the left-hand side.
set number

"set laststatus=2

"set statusline=%t

"ayu theme settinngs
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

call plug#begin()

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"custom copy/paste to system buffer function using xclip
vnoremap <leader>y :w !xclip -selection clipboard<CR><CR>
nnoremap <leader>p :r !xclip -selection clipboard -o<CR>
