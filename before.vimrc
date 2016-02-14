autocmd FileType java set omnifunc=javacomplete#Complete
if filereadable("AndroidManifest.xml")
    let g:JavaComplete_SourcesPath = "target/generated-sources/r"
endif
