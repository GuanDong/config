set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

function! GradleClasspath()
  let l:gradleFile = gradle#findGradleFile()
  if ! filereadable(l:gradleFile)
    return
  endif

  let l:isTaskExist = 0
  for line in readfile(l:gradleFile)
    if line =~ "^task classpath << {$"
      echo line
      let l:isTaskExist = 1
    endif
  endfor

  if l:isTaskExist == 0
    silent! execute "!echo " . '"\ntask classpath << {\n\tconfigurations.compile.each { jar ->\n\t\tprint \":\${jar.path}\"\n\t}\n}"' . " >> " . l:gradleFile
    exec "redraw!"
  endif
  let l:targetJar = gradle#getTargetJarPath()
  let $CLASSPATH = '.:' . gradle#findRoot() . '/build/intermediates/classes/debug:' . l:targetJar . system(gradle#bin() . ' -q classpath')
  silent! call javacomplete#SetClassPath($CLASSPATH)
  let g:JavaComplete_LibsPath = $CLASSPATH
  let g:syntastic_java_javac_classpath = $CLASSPATH
endfunction
