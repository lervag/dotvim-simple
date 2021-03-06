if exists('b:did_ftplugin_personal') | finish | endif
let b:did_ftplugin_personal = 1

setlocal textwidth=0
setlocal wrap

call vimtex#imaps#add_map({
      \ 'lhs' : '<m-i>',
      \ 'rhs' : '\item ',
      \ 'leader'  : '',
      \ 'wrapper' : 'vimtex#imaps#wrap_environment',
      \ 'context' : [
      \   'itemize',
      \   'enumerate',
      \   {'envs' : ['description'], 'rhs' : '\item['},
      \ ],
      \})
