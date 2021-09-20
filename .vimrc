set nocompatible " Enable vim only features

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Allow backspacing over everything
set backspace=indent,eol,start

" Remember up to 5000 'colon' commmands and search patterns
set history=5000

" Turn on syntax highlighting
syntax enable

" Don't put swap files in the file's directory
set dir-=.

 " Allow editing of utf-8 files
set encoding=utf-8

" Set the background to dark
set background=dark

"colorscheme gotham
color pablo
hi MatchParen term=reverse ctermbg=blue

" Highlight while searching
set hlsearch

" Use incremental searching
set incsearch

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Autoindent
set autoindent
set smartindent
set nowrap

" When a bracket is inserted, briefly jump to a matching one
set showmatch
set matchtime=3 " Match brackets for 3/10th of a sec.

" file/command completion mode
set wildmode=longest,list

" case-smart searching
set ignorecase
set smartcase

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" Show tabs and trailing spaces
set list
"set listchars=tab:»·,trail:·
set listchars=tab:\|·,trail:·
hi SpecialKey term=NONE ctermfg=4 guifg=#303030

" Explicitly tell Vim that the terminal supports 256 colors
set t_Co=256

" ============== Vundle ===============
set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'ciaranm/detectindent'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
" NERDTree custom mappings to make i and s reuse existing windows
Plugin 'git://gist.github.com/1588299.git'
" nerdtree plugin to integrate nerdtree with :grep
Plugin 'git://gist.github.com/205807.git'
"NoPlugin 'tsaleh/vim-matchit'
Plugin 'tpope/vim-fugitive'
"NoPlugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"NoPlugin 'tpope/vim-rails.git'
" vim-scripts repos
"NoPlugin 'L9'
"NoPlugin 'FuzzyFinder'
" Puppet syntax highlighting
" Plugin 'rodjek/vim-puppet'
" Fancy status lines
Plugin 'bling/vim-airline'
" Solarized Colorscheme
Plugin 'altercation/vim-colors-solarized'
" ===== Non Github repos
" Easy opening of files
"NoPlugin 'git://git.wincent.com/command-t.git'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     " required!
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" ================ End Vundle ================


" =============================================
" Plugin Configs
" =============================================

" Airline Config
let g:airline_detect_paste=1
let g:airline_theme="dark"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'
" Always show status line, even for one window, for powerline/airline
set laststatus=2

" NERDTree settings
" start NERDTree with vim
autocmd vimenter * if !argc() | NERDTree | endif
" close vim if NERDTree is the only window left
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=40
nnoremap <C-s> :NERDTreeToggle<CR>

" FuzzyFinder settings
let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'FavFile':{}, 'Tag':{}, 'TaggedFile':{}}
let g:FuzzyFinderOptions.Base.ignore_case = 1
let g:FuzzyFinderOptions.Base.abbrev_map  = {
      \   '\C^VR' : [
      \     '$VIMRUNTIME/**',
      \     '~/.vim/**',
      \     '$VIM/.vim/**',
      \     '$VIM/vimfiles/**',
      \   ],
      \ }
let g:FuzzyFinderOptions.MruFile.max_item = 200
let g:FuzzyFinderOptions.MruCmd.max_item = 200
nnoremap <silent> <C-n>      :FuzzyFinderBuffer<CR>

" =============================================
" Custom functions
" =============================================

" =============================================
" Personal Preferences
" =============================================

" Map Shift-Space to Esc to switch modes
inoremap <S-Space> <Esc>
nnoremap <S-Space> <Esc>

" Show vertical line length 'soft' limits
if exists('+colorcolumn')
    set colorcolumn=80,120
    hi ColorColumn ctermbg=232 guibg=#220000
endif

