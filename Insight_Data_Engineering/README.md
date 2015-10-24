# Tweet Word Analyzer
##### by Francisco de Villalobos
### Insight Data Engineering Challenge

#### Description
Tweet analyzer class which takes in a txt file and outputs certain result statistics:

1. File with every word in every tweet in the input file, with the total word count for every tweet
File output by default in ./tweet_output/
2. File with the accumulated median of unique words per tweet as if the tweets were coming in real time.
First value has median of first tweet which is equal to unique words in tweet.
Second value median of unique words for first two tweets and so on...

#### Dependencies
The following Python libraries have to be installed in the system for the code to run
- numpy
- sklearn

#### System info
- Programmed in: MaxOSX 10.10.4
- Tested on Python 2.7.9

#### Assumptions and instructions
- Each tweet only contains lowercase letters, numbers, and ASCII characters like ':', '@', and '#'.
- A word is defined as anything separated by whitespace.
- All punctuation has been treated as part of the word itself.

#### Troubleshooting:
1. If run.sh does not run:  $ chmod u+x run.sh , to make the script runnable (should already be).
2. Found that installing and looking for sklearn in a computer can be tricky. Please be sure
to install sklearn and that python can find it to execute the program correctly.
You will get 'no module named sklearn' if you don't.

### Other Data Engineering notes
This approach has been simplified for us in the Data Engineering Challenge to test
the level of candidates. I did not wish to go beyond the rules of the challenge,
but this SAME code has the potential to implement stop words, ignore punctuation
in words, and treat family words as the same root one for better analytics.
Sklearn is a very powerful package and can do tokenization, stop words, pre-processing,
and a lot of other stuff. It is also very fast and memory efficient as it uses
sparce matrices.

While I'm sure some compiled code like C++ may implement a faster code, my choice
for data processing in a development code is always first in Python.
