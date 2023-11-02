# Scanner

Starting as a simple language scanner and building out to a front end for an interpreter and formatter.

Rather than use lexx, yacc, or whatever, I'm rolling my own. I'm using mostly late 70s into the 80s tooling and paradigms just for fun. This is a personal project for personal goals. 

## Notes on Style

This code is written with Free Pascal 3.22 using the objfpc mode {$MODE objfpc} and AnsiStrings {$H+}. This means:

* integers are longints
* strings may be arbitrarily long and will have a trailing null character but embedded nulls are allowed.
* exceptions are available may be used
* dynamic arrays are available and may be used
* object orientation is avoided

## Licensing and copyright

All my code is released with the unlicense. To whatever extent a copyright is needed, this is copyright 2023 by Troy Brumley.

## files

| name | description |
|------|-------------|
| scanner.pas | currently the main program, a frame to build upon |
| tokenizer.pas | the actual tokenizer |
| pasTokenDefs.pas | generated from pasTokenDefs.txt by generator.pas |
| pasTokenEnum.pas | also generated and then included in pasTokenDefs.txt |
| characterPredicates.pas | common things to check in characters and strings |
| displayFormatters.pas | various output utility procedures |
| generator.pas | creates the data tables for the scanner and tokenizer. |
| pasTokenDefinitions.txt | input to generator.pas. Should be self documenting. |


