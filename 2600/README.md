2600 Programming
====================

Right now, this directory focuses on code from the udemy class, [Programming Games for the Atari 2600](https://www.udemy.com/course/programming-games-for-the-atari-2600), with my own spin on stuff in `mycode`

For example, I made a much more sophisticated Makefile system for building cartridges. It still has room for improvement, but you can basically just include `mycode/cartbuilder.mk` and define your cartname at the top of a new `Makefile` and use some make rules to assemble and link; as well as run the ROM properly in the stella emulator.

I imagine I'll end up with even more scratch code and snippets in here as I go. I'll try to keep it neat since I'm sharing it. Also, I still haven't fixed up my early/old code from previous lessons to use the new make rules.

## My Setup
*  dasm assembler
*  stella emulator
*  using include files from dasm and provided by Prof. Gustavo Pezzi
