set foldmethod=manual

"Plugins
call plug#begin('~/.config/nvim/plugged')
"Make sure you use single quotes
Plug 'Vimjas/vim-python-pep8-indent' "modifies Vim’s indentation behavior to comply with PEP8
Plug 'Xuyuanp/nerdtree-git-plugin' "Adds git status indicator to the nerdtree
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim' "Ctrl-p shortcut to find files
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank' "highlight the yanked region
Plug 'mbbill/undotree'
Plug 'nelstrom/vim-visual-star-search'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'} "Autocomplete plugin
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' "Filetree
Plug 'sheerun/vim-polyglot' "Add syntax highlighting for almost any language
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope' "Highlights some characters to help with f/F/t/T motions
Plug 'zefei/vim-colortuner' "Adjust colors using sliders, :Colortuner
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

if has('syntax') && !exists('g:syntax_on')
  " enable syntax highlighting
  syntax enable
  set foldmethod=syntax
endif

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

"show the mode i am in
set showmode 

" tab and space settings
set tabstop=2 softtabstop=0 expandtab shiftwidth=2
" python special settings
au FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Enable rainbow parentheses
let g:rainbow_active = 1

" By default python-mode uses python 2 syntax checking. To enable python 3 syntax checking
let g:pymode_python = 'python3'
" don't use rope completion for python
let g:pymode_rope_complete_on_dot = 0
" disable colorcolumn display at maxlength
let g:pymode_options_colorcolumn = 0

" show a visual line under the cursor's current line 
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

colorscheme hybrid_material

"configuring normal os key combinations for cut, copy, paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"Start undotree automatically on startup
"autocmd vimenter * UndotreeToggle
"let g:undotree_HighlightChangedText = 0

"hybrid line numbering mode
set number
set relativenumber

" search as characters are entered
set incsearch 
" highlight matches
set hlsearch          
" clear highlighting
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
" searches are case insensitive...
set ignorecase    
" ... unless they contain at least one capital letter
set smartcase     

"indents
set autoindent

" folding enable
if has("folding")
  set foldenable
endif

"bind space to leader
let mapleader = "\<Space>"

"switch : and ;
nnoremap ; :
nnoremap : ;

"turn off search highlight with double space
nnoremap <leader><space> :nohlsearch<CR>

" Make the backspace behave as most applications. 
" Vim's default behaviour when pressing the backspacing is somewhat peculiar, it
" won’t allow you to backspace to the previous line, automatically inserted
" indentation, or previously inserted text.
set backspace=indent,eol,start

" Store temporary files in ~/.vim/tmp  By default Vim will store various
" files in the current directory. These files are useful, but storing them in
" the current directory next to the original file usually isn’t.
"
" With this enabled Vim will store all these files in the user’s home directory.
set viminfo+=n~/.config/nvim/tmp/viminfo
set backupdir=$HOME/.config/nvim/tmp/backup
set dir=$HOME/.config/nvim/tmp/swap
set viewdir=$HOME/.config/nvim/tmp/view
if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p', 0700) | endif
if !isdirectory(&dir)       | call mkdir(&dir, 'p', 0700)       | endif
if !isdirectory(&viewdir)   | call mkdir(&viewdir, 'p', 0700)   | endif

" Persist undo history between Vim sessions.  Store undo history to a file,
" so that it can be recalled in future Vim sessions.
"
" Also see "How can I use the undofile?": https://vi.stackexchange.com/q/6/51
" and "Can I be notified when I'm undoing changes from the undofile?":
" https://vi.stackexchange.com/q/2115/51.
if has('persistent_undo')
  set undofile " Maintain undo history between sessions
  set undodir=$HOME/.config/nvim/tmp/undo
  if !isdirectory(&undodir) | call mkdir(&undodir, 'p', 0700) | endif
  set undolevels=1000
  set undoreload=10000
endif

" mouse works in most terminal software we use...
set mouse+=a

" fold settings
" set foldlevelstart=1
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
" set foldlevel=1

" Remove menu options for GVim
set guifont=Source\ Code\ Pro\ Medium:h12
" set guifont=Fira\ Code\ Medium:h13

" indent all parts of html
" let g:html_indent_inctags = "html,body,head,tbody" 

" Press C-r in visual mode to replace the text highlighted
" vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Activate deoplete
" let g:deoplete#enable_at_startup = 1

" Activate rainbow parentheses
let g:rainbow_active = 1

" python linter for ale
let g:ale_linters = {'python': ['flake8']}

" Show as much of the line as will fit.  By default Vim will display only
" "@" characters if the last line on the screen won't fit when 'wrap' is
" enabled.
"
" If this is enabled Vim will display as much as the last line as will fit and
" display "@@@" at the end.
"
" There is another useful option for 'display' that I rather like: "uhex". This
" will make Vim show unprintable characters as &lt;xx&gt; rather than ^L (Use
" |i_CTRL-V| in insert mode to see the difference.)
set display=lastline

" Better tab completion in the commandline.  Make commandline-completion
" (after you type :) behave more useful and roughly like most shells do.
"
" See 'wildmode' on how to configure the completion mode to your liking.
set wildmenu

set wildmode=list:longest  " List all matches and complete to the longest match.

" 'wildignore' is useful setting to ignore binary files such as compiler
" output, images, etc.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Ignore some files for ctrlp completion
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Ignore files in .gitignore for ctrlp completion
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Remove octal support from 'nrformats'.  This controls how Vim should
" interpret numbers when pressing |CTRL-A| or |CTRL-X| to increment to decrement
" a number. By default numbers starting with a 0 are treated as octal numbers,
" which can be rather confusing, so remove that.
set nrformats-=octal

" Minimum number of lines to keep above/below cursor.  Keep lines above and
" below the screen when scrolling up or down. This is useful so you have some
" context what you’re scrolling to.
"
" Also see 'sidescrolloff'.
set scrolloff=5

" Load matchit.vim plugin.  The matchit.vim plugin that comes bundled with
" Vim expands the |%| key to work with various programming language keywords
" (e.g. jumping between if and end in Ruby).
" Only load if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif

"NERDTree on startup
"autocmd VimEnter * NERDTree | wincmd p

"Shortcut to toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Re-select previously yanked text
nnoremap gb `[v`]

" https://old.reddit.com/r/vim/comments/c9s2ax/shared_clipboard_is_great/
set clipboard^=unnamedplus

" coc.nvim configuration ------------------

let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-markdownlint',
  \ 'coc-python',
  \ 'coc-r-lsp',
  \ ]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-t>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
    \}
