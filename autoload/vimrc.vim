"
" Vimrc helper functions
"

function! vimrc#init() abort " {{{1
  " Use space as leader key
  nnoremap <space> <nop>
  let g:mapleader = "\<space>"

  " Add personal files to runtimepath
  let &runtimepath = vimrc#path('personal') . ',' . &runtimepath
  let &runtimepath .= ',' . vimrc#path('personal/after')

  " Get some system information and define some paths/urls
  let g:vimrc#bootstrap = !filereadable(vimrc#path('autoload/plug.vim'))

  let g:vimrc#path_bundles = vimrc#path('bundle')

  " If plug.vim is not available, then we source the init script
  if g:vimrc#bootstrap
    execute 'silent !' . vimrc#path('init.sh')

    " Apply some minimal settings
    let g:plug_window = 'new|wincmd o'
    silent! colorscheme my_solarized

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd VimEnter * nested PlugInstall --sync | source $MYVIMRC
    " vint: +ProhibitAutocmdWithNoGroup
  endif
endfunction

" }}}1
function! vimrc#path(name) abort " {{{1
  return s:path . '/' . a:name
endfunction

" }}}1

let s:path = fnamemodify(expand('<sfile>'), ':p:h:h')
