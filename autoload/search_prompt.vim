
if &cp || exists('autoloaded_search_prompt')
  finish
endif
let autoloaded_search_prompt = 1

function! search_prompt#search_project()
  let base = ProjectRootGuess()
  call search_prompt#search_path(base)
endfunc

function! search_prompt#search_current()
  let base = expand('%:p:h')
  call search_prompt#search_path(base)
endfunc

function! search_prompt#search_pwd()
  let base = getcwd()
  call search_prompt#search_path(base)
endfunc

function! search_prompt#search_path(base)

  call inputsave()
  let l:exp = input('Search [' . a:base  . ']: ')
  call inputrestore()
  if(l:exp == "")
    echom "No input, ignoring!"
    return
  endif

  " TODO: build from a dictionary, allow user configurable
  if(&filetype == "c" || &filetype == "cpp")
    let l:root =  a:base . "/**/*.c"
        \ . " " . a:base . "/**/*.h"
        \ . " " . a:base . "/**/*.cc"
        \ . " " . a:base . "/**/*.hh"
        \ . " " . a:base . "/**/*.cpp"
        \ . " " . a:base . "/**/*.hpp"
        \ . " " . a:base . "/**/*.cxx"
        \ . " " . a:base . "/**/*.hxx"
        \ . " " . a:base . "/**/*.inl"
        \ . " " . a:base . "/**/*.m"
        \ . " " . a:base . "/**/*.mm"
  elseif(&filetype == "cmake")
    let l:root =  a:base . "/**/CMakeLists.txt"
        \ . " " . a:base . "/**/*.cmake"
  else
    " For file-types with only a single extension,
    " use the current extension as-is.
    " Works fine for many cases.
    let l:root = a:base . "/**/*." . expand('%:e')
  endif

  execute 'vimgrep' l:exp l:root
endfunc

