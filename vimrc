" --------------
" --- Installation du plugin manager
" --------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'vim-scripts/Conque-GDB'
"-Plugin 'valloric/youcompleteme'
"-Plugin 'maralla/completor.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'shougo/vimshell.vim'
call vundle#end()
filetype plugin indent on

" --------------
" --- Configuration de la status line (lightline)
" --------------

set laststatus=2
set noshowmode


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \  'right': [ [ 'lineinfo', 'charvaluehex' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" --------------
" --- Gestion des buffers 
" --------------

set hidden			" Permet de ne pas sauver pour changer de buffer
nnoremap <C-RIGHT> :bnext<CR>	
nnoremap <C-LEFT>  :bprev<CR>


" --------------
" --- Gestion des tabs
" --------------

nnoremap <C-UP> :tabn<CR>	
nnoremap <C-DOWN>  :tabp<CR>

" --------------
" --- Cursorline 
" --------------

set cursorline
hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=black guibg=darkgrey guifg=black
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" --------------
" --- interface 
" --------------

set showcmd 				        " Affiche les commandes en cours de frappe
set backspace=indent,eol,start		" Permet d'effacer l'indentation automatique, les retours chariots et d'aller au dela de l'endroit d'activation du mode insert
set history=1000			        " Historique plus long
set wildmenu				        " Active le menu de complétion sur la touche tab
set wildmode=longest:full,full
set mouse=a				            " Support souris (scroll,selection, etc.)
set scrolloff=3				        " Affiche toujours 3 lignes pre/post curseur
set sidescrolloff=5			        " Affiche toujours 5 colonnes pre/post curseur
set autoread				        " Relit un fichier si modifié en dehors de vim


set number				            " Affiche les numéros de ligne
highlight LineNr cterm=NONE ctermfg=DarkGrey ctermbg=NONE guifg=DarkGrey guibg=NONE


" --------------
" --- Reglages activés par défaut 
" --------------
"colorscheme solarized
" set background=dark			    " Choix d'un fond sombre
" set showmode				        " Affiche le mode (insert/visual) 
" set ruler				            " Affiche la position dans le fichier en bas à droite
" set title				            " Affiche le titre dans la barre du terminal

" --------------
" --- Fichiers Swap et Backup
" --- Fichiers vimrc spécifiques
" --------------

set directory=$HOME/.vim/swap_files//	" Stockage des swap files dans ~/.vim/swap_files
set backupdir=$HOME/.vim/backup_files// " Stockage des backups dans ~/.vim/backup_files
set nowritebackup		                " Enregistre directement dans le fichier (plutot que de passer par un fichier temporaire)
set exrc				                " Autorise des fichiers vimrc propres aux projets
 
" --------------
" --- Encodage et rendu des caractères
" --------------

set encoding=utf-8		    	" Definition du charset de travail de vim (buffer,registres,...), possible d'avoir un fichier dans un charset different avec fileencoding
set tabstop=4       			" Reduit l'affiche d'un <TAB> à 4 espaces (defaut a 8) (attention pose problèmes d'incohérences de rendu)
set shiftwidth=4    			" indente par 4 colonnes
set expandtab       			" Convertit tous les tabs qui sont tapés en espaces
set nowrap				        " Les lignes longues ne sont pas affichées tronquées
set linebreak				    " Ne permet la troncature de ligne que sur les caractères de 'breakat' (inutile avec nowrap)

syntax enable				    " active la coloration syntaxique

" --------------
" --- Tricks
" --------------

set timeoutlen=1000 ttimeoutlen=0   " Annule le petit délai lors du retour en mode normal


" --------------
" --- Plugin ConqueGdb 
" --------------
"
let g:ConqueGdb_Leader = ','
let g:ConqueTerm_Color = 2                                                            
let g:ConqueTerm_CloseOnEnd = 1                                                       
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_StartMessages = 1                                                    
let g:ConqueGdb_ToggleBreak = g:ConqueGdb_Leader . 'b'


"----------------
"--- Plugin Indent
"----------------
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey


hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey
"-----------------
"--- NerdTree-----
"-----------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

"-----------
"---Syntastic
"-----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"------------
"---POLYGLOT--
"------------
let g:polyglot_disabled = ['css']
