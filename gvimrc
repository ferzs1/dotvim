" Don't be compatible with vi.
set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle manages Vundle. Vundleception!
Bundle 'gmarik/vundle'

" Nyan cat is critical.
Bundle 'koron/nyancat-vim'

" Tim Pope FTW.
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'

" Scrooloose FTW.
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'ciaranm/inkpot'
Bundle 'flazz/vim-colorschemes'

" Syntaxes and language support
Bundle 'juvenn/mustache.vim'
Bundle 'beyondwords/vim-twig'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'tangledhelix/vim-octopress'
Bundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'

" Helpers
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/zencoding-vim'
Bundle 'mhinz/vim-signify'
Bundle 'msanders/snipmate.vim'

if &termencoding == ""
	let &termencoding = &encoding
endif
set encoding=utf-8

" ############################################################################
" #			Bootstrap my configuration and plugins (with Pathogen)			 #
" ############################################################################

" I use vim in four environments: gVim in Windows, MacVim in OS X, and
" terminal vim in various shells (Cygwin, OS X, Ubuntu). The major differences
" between the environments is the way paths are expressed and my own personal
" path preferences for storage of select files. This is the only way I could
" come up with to close that gap efficiently.
if has("gui_win32")
	" This covers Windows GUI only.
	let s:config_prefix = $HOME.'\vimfiles\'
	" Don't load Powerline in Windows because I open a lot of files over
	" network shares and Powerline makes Vim crawl.
	" let g:Powerline_loaded = 1
elseif has("win32unix")
	" This covers the Cygwin terminal, which has POSIX-style paths, but should
	" use the Windows gVim installation for simplicity.
	let s:config_prefix = $HOME.'/vimfiles/'
else
	" This covers everything else, which will include MacVim and any UN*X-like
	" shell.
	let s:config_prefix = '~/.vim/'
endif

" Load Pathogen.
"call pathogen#infect()

" Fix the Solarized mapping.
call togglebg#map("")

" Now enable syntax highlighting and filetype stuff.
syntax on

" Enable filetype handling.
filetype plugin indent on

" Now process all of the configuration files that I have stored in my 'config'
" directory, which significantly cleans up this file.
for f in sort(split(glob(s:config_prefix.'config/*.vim'), '\n'))
	execute 'source '.f
endfor
