colorscheme desert         " awesome colorscheme

cmap w!! %!sudo tee > /dev/null

syntax enable           " enable syntax processing

" Nerd Tree

 " auto open nerdtree when vim starts "
 autocmd vimenter * NERDTree

 " Toggle NERDTree with Ctrl-N
 map <C-n> :NERDTreeToggle<CR>

 " Show hidden files in NERDTree
 let NERDTreeShowHidden=1

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

 " Haskell Vim config
  let g:haskell_classic_highlighting = 1
  let g:haskell_indent_if = 3
  let g:haskell_indent_case = 2
  let g:haskell_indent_let = 4
  let g:haskell_indent_where = 6
  let g:haskell_indent_before_where = 2
  let g:haskell_indent_after_bare_where = 2
  let g:haskell_indent_do = 3
  let g:haskell_indent_in = 1
  let g:haskell_indent_guard = 2
  let g:haskell_indent_case_alternative = 1
  let g:cabal_indent_section = 2

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')} " Set status line display

set number              " show line numbers

set showmode            " show mode in bottom bar
set showcmd             " show command in bottom bar

" Vim-plug set up

call plug#begin('~/.vim/plugged')

 " Haskell
 Plug 'https://github.com/neovimhaskell/haskell-vim' " haskell syntax highlighting

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

 " Project directory split"
 Plug 'https://github.com/scrooloose/nerdtree'

 " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align 
 Plug 'junegunn/vim-easy-align'
  
 " Any valid git URL is allowed
 Plug 'https://github.com/junegunn/vim-github-dashboard.git'
  
 " Multiple Plug commands can be written in a single line using | separators
 Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  
 " On-demand loading
 Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  
 " Using a non-master branch
 Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
  
 " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
 Plug 'fatih/vim-go', { 'tag': '*' }
  
 " Plugin options
 Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
  
 " Plugin outside ~/.vim/plugged with post-update hook
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  
 " Unmanaged plugin (manually installed and updated)
 Plug '~/my-prototype-plugin'
  
 " Initialize plugin system
call plug#end()
