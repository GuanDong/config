" Java配置 {{{
if count(g:vimified_packages, 'java')
  Bundle 'artur-shaik/vim-javacomplete2'
  autocmd FileType java set omnifunc=javacomplete#Complete
  nmap <F4> <Plug>(JavaComplete-Imports-Add)
  imap <F4> <Plug>(JavaComplete-Imports-Add)
  nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)
  imap <F5> <Plug>(JavaComplete-Imports-AddMissing)
  nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
  imap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)

  Bundle 'hsanson/vim-android'
endif
" }}}

" Scala配置 {{{
if count(g:vimified_packages, 'scala')
  Bundle 'derekwyatt/vim-scala'
endif
" }}}

" Tab补全 {{{
Bundle "ervandew/supertab"
"  }}}

" 括号补全 {{{
Bundle "Raimondi/delimitMate"
" }}}
