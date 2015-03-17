# Introduction #

This is a simple guide how to use provided perl script


# Counters and frequency script #

This script provides the basic word counter and frequency calculation. Frequencies calculated using this script are:
  * punctuation symbols frequency
  * function words frequency
  * function words group frequency (_to be added_)
  * word length frequency


### Punctuation symbols frequency ###
The punctuation symbols frequency is calculated by the fallowing formula:
```
FREQ_OF_SYMBOL=NO_OF_SYMBOL_IN_TEXT/NO_OF_ALL_SYMBOLS_IN_TEXT
```
The following symbols are counted:
  * .
  * ,
  * !
  * ?
  * "
  * -
  * :
  * ;

### Word length frequency ###
Word length is calculated for lengths from 1 to 10+ where 10+ stands for words with length of 10 characters and above. The frequency is calculated using following formula:
```
FREQ_OF_LENGTH=NO_OF_WORDS_WITH_LENGTH/TOTAL_NO_OF_WORDS
```

### Function word frequency ###
Function words are (as defined by [The Free Dictionary](http://www.thefreedictionary.com/function+word)):
```
A word, such as a preposition, a conjunction, or an article, that has little semantic content of its own and chiefly indicates a grammatical relationship. Also called form word, functor.
```

Frequency of the function words is calculated by the following formula:
```
FREQ_OF_FUNCTION_WORD=NO_OF_FUNCT_WORD/TOTAL_NO_OF_WORDS
```
### Run example ###
If you want to use the script on `test.txt` for example (on windows machine):
```
perl wordCount.pl < test.txt > g.log
```