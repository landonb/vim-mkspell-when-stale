" Slugln: Simple spell file generator
" Author: Landon Bouma <https://tallybark.com/>
" Online: https://github.com/landonb/vim-mkspell-when-stale#🥖
" License: https://creativecommons.org/publicdomain/zero/1.0/
" Copyright: © 2018, 2024 Landon Bouma.
" vim:tw=0:ts=2:sw=2:et:norl:ft=vim

" YOU: Uncomment next 'unlet', then <F9> to reload this file.
"      (Iff: https://github.com/landonb/vim-source-reloader)
"
" silent! unlet g:loaded_autoload_vim_mkspell_when_stale

" Deps: Requires Vim 8+ because `glob` {list} arg.
if exists('g:loaded_autoload_vim_mkspell_when_stale')
    \ || &compatible || v:version < 800
  finish
endif

let g:loaded_autoload_vim_mkspell_when_stale = 1

" =================================================================
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" =================================================================

" *** Remake/Regenerate spelling dictionary

" Run `mkspell` to process the spell input(s).
" - For English words, might just be one file, e.g.,
"     ~/.vim/spell/en.utf-8.add
" - Generates output file named with '.spl' appended, e.g.,
"     ~/.vim/spell/en.utf-8.add.spl
" - You'd typically keep the '.add' file in a private repo
"   and symlink to it; and exclude the generated '.spl' file.
" - glob args: {path expr},
"              {nosuf} [enable 'suffixes' and 'wildignore'],
"              {list} [return List result]

" SAVVY: To see the contents of the :mkspell command, dump
"        the 'a' register after running this function, e.g.,:
"
"          "ap

function! mkspell_when_stale#MkspellWhenStale()
  " echom 'mkspell_when_stale#MkspellWhenStale...'

  for vocab in glob('~/.vim/spell/*.add', 0, 1)
    if
        \ filereadable(vocab)
        \ && (!filereadable(vocab . '.spl')
        \     || getftime(vocab) > getftime(vocab . '.spl'))
      redir @a
      silent execute 'mkspell! ' . fnameescape(vocab)
      redir END

      " echom 'Generated spell file: ' . vocab . '.spl'
      " echom 'Run "ap to see mkspell output'
    endif
  endfor
endfunction

