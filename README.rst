########################
Vim `mkspell` When Stale
########################

About This Plugin
=================

Simple Vim ``mkspell`` wrapper that runs on Vim startup and
on demand.

Mkspell-When-Stale Commands
===========================

*g:mkspell_when_stale#MkspellWhenStale()*

``g:mkspell_when_stale#MkspellWhenStale()`` feeds each ``~/.vim/spell/*.add``
file to ``mkspell`` to generate ``.spl`` files that Vim uses to spell check.

- In the most basic example, an English user has a single input
  file, ``~/.vim/spell/en.utf-8.add``

  - After running the wrapper command, or after restarting Vim,
    the wrapper command generates ``~/.vim/spell/en.utf-8.add.spl``

- This command finishes immediately if the ``.spl`` file is already
  up to date (newer than the input file).

This command runs on startup, and can also be called directly,
or perhaps from a script after updating the input file, e.g.,

.. code-block:: bash

  vim_generate_spellfile () {
    vim -c "call g:mkspell_when_stale#MkspellWhenStale()" -c q
  }

Installation
============

Installation is easy using the packages feature (see ``:help packages``).

To install the package so that it will automatically load on Vim startup,
use a ``start`` directory, e.g.,

.. code-block:: bash

    mkdir -p ~/.vim/pack/landonb/start
    cd ~/.vim/pack/landonb/start

If you want to test the package first, make it optional instead
(see ``:help pack-add``):

.. code-block:: bash

    mkdir -p ~/.vim/pack/landonb/opt
    cd ~/.vim/pack/landonb/opt

Clone the project to the desired path:

.. code-block:: bash

    git clone https://github.com/landonb/vim-mkspell-when-stale.git

If you installed to the optional path, tell Vim to load the package:

.. code-block:: vim

   :packadd! vim-mkspell-when-stale

Just once, tell Vim to build the online help:

.. code-block:: vim

   :Helptags

Then whenever you want to reference the help from Vim, run:

.. code-block:: vim

   :help vim-mkspell-when-stale

