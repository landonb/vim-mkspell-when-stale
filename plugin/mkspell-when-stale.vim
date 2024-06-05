" Slugln: Simple spell file generator
" Author: Landon Bouma <https://tallybark.com/>
" Online: https://github.com/landonb/vim-mkspell-when-stale#🥖
" License: https://creativecommons.org/publicdomain/zero/1.0/
" Copyright: © 2018, 2024 Landon Bouma.
" vim:tw=0:ts=2:sw=2:et:norl:ft=vim

" YOU: Uncomment next 'unlet', then <F9> to reload this file.
"      (Iff: https://github.com/landonb/vim-source-reloader)
"
" silent! unlet g:loaded_plugin_vim_mkspell_when_stale

" Deps: Requires Vim 8+ because autoload requires.
if exists('g:loaded_plugin_vim_mkspell_when_stale')
    \ || &compatible || v:version < 800
  finish
endif

let g:loaded_plugin_vim_mkspell_when_stale = 1

" =================================================================
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" =================================================================

" Run on Vim startup.
call g:mkspell_when_stale#MkspellWhenStale()

