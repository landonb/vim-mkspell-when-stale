" Slugln: Simple spell file generator
" Author: Landon Bouma <https://tallybark.com/>
" Online: https://github.com/landonb/vim-mkspell-when-stale#🥖
" License: https://creativecommons.org/publicdomain/zero/1.0/
" Copyright: © 2018, 2024 Landon Bouma.
" vim:tw=0:ts=2:sw=2:et:norl:ft=vim

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand("%:p") ==# expand("<sfile>:p")
  unlet g:loaded_plugin_vim_mkspell_when_stale
endif

" Deps: Requires Vim 8+ because `glob` {list} arg.
if exists("g:loaded_plugin_vim_mkspell_when_stale") || &cp || v:version < 800

  finish
endif

let g:loaded_plugin_vim_mkspell_when_stale = 1

" -------------------------------------------------------------------

" Run on Vim startup.
call g:mkspell_when_stale#MkspellWhenStale()

