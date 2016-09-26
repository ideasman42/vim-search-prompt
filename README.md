# vim-search-prompt

Simple vimgrep wrapper for quick project wide search.

Motivation
----------

Having used some IDE's, I missed having a simple project-wide search,
finding using vimgrep directly rather verbose and inconvenient for quick searches.


Features
--------

  * Context sensitive file types:
    Where searching from C source limits the search to C, C++ and headers.
    Searching from CMake limits the search to other CMake files.
    Otherwise the current file extension as a fallback.
  * Searches from the project root, thanks to `vim-projectroot`.


Examples
--------

Using the following key-mapping will give you a search prompt by pressing Alt-f key binding.

    nnoremap <M-f> :call SearchPromptProject()<cr>


Installation
------------

### Vundle

Add these lines to the plugin section of your vimrc.

    Plugin 'dbakker/vim-projectroot'
    Plugin 'ideasman42/vim-search-prompt'

Restart vim and run `VundleInstall`.


Functions
---------

  * `SearchPromptProject` recursive search in the current project.
  * `SearchPromptCurrent` recursive search in the current files directory.
  * `SearchPromptPWD` recursive search in the current directory.


TODO
----

  * Make file-type to extension mapping configurable.
  * Support non-recursive search.

Pull requests welcome :)


License
-------

Copyright (c) Campbell Barton.  Distributed under the same terms as Vim itself.
See `:help license`.
