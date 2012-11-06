" Vundle
    " Setting up Vundle - the vim plugin bundler
        let iCanHazVundle=1
        let vundle_readme=expand("~/.vim/bundle/vundle/README.md")
        if !filereadable(vundle_readme) 
        "if !isdirectory("~/.vim/bundle/vundle")
            echo "Installing Vundle.."
            echo ""
            silent !mkdir -p ~/.vim/bundle
            silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
            let iCanHazVundle=0
        endif
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
        Bundle 'gmarik/vundle'
    " Setting up Vundle - the vim plugin bundler end

    " Bundles
        " General Vim
            Bundle "kana/vim-arpeggio"
            Bundle 'Lokaltog/vim-powerline'
            Bundle 'tomasr/molokai'
            Bundle 'scrooloose/nerdtree'
            Bundle 'https://github.com/tpope/vim-fugitive.git'
            Bundle 'Command-T'
            Bundle 'loremipsum'
            "Bundle 'sjl/gundo.vim'
            "Bundle 'TaskList.vim'
            Bundle 'taglist.vim'
            Bundle 'int3/vim-taglist-plus'
            Bundle 'mutewinter/vim-indent-guides'
            Bundle 'reinh/vim-makegreen'
            Bundle 'rosenfeld/conque-term'
            Bundle 'kien/ctrlp.vim'
            Bundle 'scrooloose/syntastic'
            Bundle 'kana/vim-smartinput'
            Bundle 'sjl/clam.vim'
        " General Vim end
    
        " Web (generic)
            Bundle 'mattn/zencoding-vim'
            Bundle 'HTML-AutoCloseTag'
            Bundle 'juvenn/mustache.vim'
            Bundle 'groenewege/vim-less'
            Bundle 'Rykka/ColorV'
            Bundle 'gregsexton/MatchTag'
            Bundle 'wavded/vim-stylus'
            Bundle 'JavaScript-Indent'
            Bundle 'tangledhelix/vim-octopress'
            Bundle 'tpope/vim-haml'
        " Web (generic) end
    
        " Javascript / node / coffeescript 
            Bundle 'pangloss/vim-javascript'
            Bundle 'itspriddle/vim-jquery'
            Bundle 'digitaltoad/vim-jade'
            Bundle 'leshill/vim-json'
            Bundle 'kchmck/vim-coffee-script'
     "       Bundle 'manalang/jshint.vim'
            Bundle 'mmalecki/vim-node.js'
            Bundle 'lambdalisue/nodeunit.vim'
        " Javascript / node /coffeescript end
    
        " Misc
            Bundle 'vim-scripts/nginx.vim'
        " Misc end
    
        " Unused (for now)
            "Bundle 'bash-support.vim'
            Bundle 'SuperTab'
            "Bundle 'dickeytk/status.vim'
            "Bundle 'snipMate'
            "Bundle 'tpope/vim-haml'
            Bundle 'Lokaltog/vim-easymotion'
            "Bundle 'Tagbar'
        " Unused (for now) end
    " Bundles end
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
    :BundleInstall
    endif
" Vundle end
 
"Set Vim defaults
    set nobackup
    set nowritebackup  
    set noswapfile    
    set nocompatible               " be iMproved
    set timeoutlen=250             " Time to wait after ESC (default causes an
    " annoying delay)
    set clipboard+=unnamed         " Yanks go on clipboard instead.
    set modeline
    set modelines=5                " default numbers of lines to read for
    set autowrite                  " Writes on make/shell commands
    set autoread
    set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path;
    " use full path as backup filename(//)
    set hidden                     " The current buffer can be put to the
    " background without writing to disk
    set hlsearch                   " highlight search
    set incsearch                  " show matches while typing
    let g:is_posix = 1             " vim's default is archaic bourne shell,
    set tabstop=2                 " tab size eql 4 spaces
    set softtabstop=2
    set sts=2
    set sw=2
    set expandtab
    "set tw=80
    set autoindent
    set clipboard+=unnamed " share windows clipboard
    set directory=~/.vim/tmp " directory to place swap files in
    set mouse=a "enable mouse in GUI mode
    set mousehide                 " Hide mouse after chars typed
    set showmatch                 " Show matching brackets.
    set novisualbell              " No blinking
    set noerrorbells              " No noise.
    set cc=121 " Right column
    set encoding=utf8
    set ai "Auto indent
    set si "Smart indet
    set wrap "Wrap lines
    set number                    " Line numers

    set history=1000
    set undolevels=1000

    " Setup persistently store the undo folder
    if ! isdirectory(expand('~/.vimundo'))
      call mkdir(expand('~/.vimundo'))
    endif
     
    " Set persistent undo
    set undodir=~/.vimundo
    set undofile

    try
        lang en_US
    catch
    endtry
    "set exrc			" enable per-directory .vimrc files
    "set secure         " disable unsafe commands in local .vimrc files

    "http://vim.wikia.com/wiki/Create_underlines,_overlines,_and_strikethroughs_using_combining_characters
    " modify selected text using combining diacritics
    command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
    command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
    command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
    command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')
    
    function! s:CombineSelection(line1, line2, cp)
      execute 'let char = "\u'.a:cp.'"'
      execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
    endfunction
" Vim defaults end

" Keymaps
    map <silent> ,r :silent NERDTreeToggle <CR>
   " map <silent> ,r :call g:ToogleNERDTreeLikeAChamp() <CR>
    map <silent> <S-F2> <ESC>:NERDTreeToggle <RETURN><CR>
    map <silent> <F3> <ESC>:CommandT<RETURN>
    "map <Leader>] <Plug>MakeGreen " change from <Leader>t to <Leader>]
    "map <silent> <F8> :call MakeGreen() <RETURN>
    "Oy vei, trying without arrows
    "nnoremap <up> <nop>
    "nnoremap <down> <nop>
    "nnoremap <left> <nop>
    "nnoremap <right> <nop>
    "inoremap <up> <nop>
    "inoremap <down> <nop>
    "inoremap <left> <nop>
    "inoremap <right> <nop>
    map <F1> <Esc>
    imap <F1> <Esc>
" Keymaps end

" Filetype overrides

    " Javascript / Coffeescript / Node
        au BufNewFile,BufRead *.less set filetype=less
        au BufNewFile,BufRead *.coffee set filetype=coffee
        au! BufRead,BufNewFile *.json set filetype=json 
        au BufRead,BufNewFile *.ejs set filetype=html
        au BufRead,BufNewFile *.eco set filetype=html
        au BufNewFile,BufRead *.coffee set shiftwidth=2
        au FileType javascript set shiftwidth=2
        au BufNewFile,BufRead *.coffee set tabstop=2
        au FileType javascript set tabstop=2
        au BufNewFile,BufRead *.coffee set softtabstop=2
        au FileType javascript set softtabstop=2
        "au BufNewFile,BufRead *.coffee compiler nodeunit
        "au BufNewFile,BufRead *.coffee compiler coffee
        "autocmd BufWritePost *.coffee silent CoffeeMake! -b | cwindow
        "au FileType javascript compiler nodeunit
    " Javascript / Coffeescript / Node end

    " Web
        au BufNewFile,BufRead *.styl set filetype=stylus
        au BufNewFile,BufRead *.stylus set filetype=stylus
        au! BufWinEnter *.scss call colorv#preview("S")
        au! bufwritepost *.scss call colorv#preview("S")
        au! BufWinEnter *.styl call colorv#preview("S")
        au! bufwritepost *.styl call colorv#preview("S")
        autocmd BufNewFile,BufRead *.markdown setfiletype octopress
    " Web end

" Filetype overrides end


" Vim Plugin Configs
    "set t_Co=256
    colorscheme molokai 
    set background=dark

    let g:Powerline_symbols = 'fancy'

    if has('statusline')
    	set laststatus=2
    	" Broken down into easily includeable segments
    	set statusline=%<%f\    " Filename
    	set statusline+=%{fugitive#statusline()} "  Git Hotness
    	set statusline+=\ [%{&ff}/%Y]            " filetype
    	set statusline+=\ [%{getcwd()}]          " current dir
    endif
    let g:user_zen_expandabbr_key='<C-e>'
    syntax on                      " enable syntax
    filetype plugin indent on " load filetype plugins/indent settings
    let NERDTreeShowHidden=1
    "let g:ConqueTerm_TERM = 'xterm-color256'
    let g:ConqueTerm_ReadUnfocused = 1
    let g:ConqueTerm_InsertOnEnter = 1
    let g:pymode_lint_checker = "pylint"
    "let g:syntastic_python_checker = 'pylint'
    let g:syntastic_check_on_open=0
    "let g:syntastic_auto_loc_list=1
    "let g:ropevim_guess_project=1
    let g:pymode_folding=0
    let g:pymode_lint_ignore=""

    set visualbell t_vb=

    noremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

" Vim Plugin Configs end

" Custom functions FTW
    function! g:ToogleNERDTreeLikeAChamp()
        "Opens NERDTree if closed, focus on NERDTree if open
        "and focus on a file or (FINALLY) close when focused on the NERDTree
        if exists("t:NERDTreeBufName")
            if (bufwinnr(t:NERDTreeBufName) != -1)
                :wincmd w
                return
            endif
        endif
        :NERDTreeToggle
    endfunction
" Custom functions FTW end
