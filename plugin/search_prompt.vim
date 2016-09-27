" search_prompt.vim - quick project search.
" Maintainer: Campbell Barton
" Version:    0.1
" License:    The same license as Vim itself, see `:h license`

if &cp || exists('loaded_search_prompt')
  finish
endif
let loaded_search_prompt = 1

command! -complete=command SearchPromptProject :call search_prompt#search_project()
command! -complete=command SearchPromptCurrent :call search_prompt#search_current()
command! -complete=command SearchPromptPWD :call search_prompt#search_pwd()

