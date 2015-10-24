# Unique Word Counter for Tweets

import sys, getopt
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer

class TweetWordCount:

    def __init__(self):
        '''
        Constructor:
        Arguments:
            - inputfile: string with the relative file location where all tweets are stored
            - outfolder: string with the relative folder location for writing outputs
        '''
        self.count_per_word         = None
        self.unique_words_per_tweet = None
        self.vectorizer             = None


    def fit(self, inputfile):
        '''
        Fit the model with data from the inputfile
        Stores:
            - count_per_word: Sparce Matrix with every single word count for every tweet
            - unique_words_per_tweet: List of unique words in each tweet
            - vectorizer: Fitted model from the input data with all the words in it
        '''

        lines = [line.rstrip('\n') for line in open(inputfile)]                 # Get all the lines (tweets) into a list

        # Create an instance of CountVectorizer of sklearn to fit the model
        self.vectorizer = CountVectorizer(analyzer = "word",    \
                                     decode_error = 'ignore',   \
                                     tokenizer = None,          \
                                     preprocessor = None,       \
                                     stop_words = None,         \
                                     lowercase = True,          \
                                     token_pattern = '(\S+)',   \
                                     max_features = 50000000)

        # Fits the model with the words into sparce matrices and stores counts for
        # each word. Sparce matrices optimize space in large numbers (most values are 0)
        bow = self.vectorizer.fit_transform(lines)
        occurrences = bow.toarray()                      # Matrix of word count per tweet. Most values will be zero. Sparce matrices help greatly.
        num_tweets  = len(occurrences)                   # Number of tweets in the file
        self.count_per_word = occurrences.sum(axis=0)    # Sum up all tweet word counts for grand total

        # Count in the bag of words the words per tweet different than zero
        # We get a vector of unique words per tweet this way
        self.unique_words_per_tweet = (bow.toarray() != 0).sum(axis=1)


    def print_results(self, outfolder):
        '''
        Print results of fitted model to files:
            - outfolder/ft1.txt --> List of words and the TOTAL
                word count in all tweets for that word
            - outfolder/ft2.txt --> List of accumulated unique word medians
                as if the tweets were coming in one by one.
                First value has median of first tweet which is equal to unique words in tweet.
                Second value median of unique words in first two tweets and so on...
        '''
        # FT1
        f1       = open(outfolder+'ft1.txt', 'w+')
        template = "{Word:40} {TotalCount:5} {NextLine:1}"                      # Create nice template for printing

        # Write word and count of word into the text file in a pretty way
        for index, word in enumerate(self.vectorizer.get_feature_names()):
            f1.write(template.format(Word=word, TotalCount=str(self.count_per_word[index]), NextLine='\n'))

        # FT2
        # Iterate through list and find the accumulated median till that tweet
        # as if we were reading them in real time
        f2 = open(outfolder+'ft2.txt', 'w+')
        for i in range(len(self.unique_words_per_tweet)):
            f2.write('{0:.2f}\n'.format( np.median(self.unique_words_per_tweet[:i+1]) ))    # Write new median for tweets in file


def main():
    '''
    Main Loop Called by the shell script
    '''
    # Get arguments from the command line
    inputfile  = './tweet_input/tweets.txt'                                     # Default input file name in case there is no argument
    outfolder = './tweet_output/'                                               # Default output folder in case there is no argument
    try:
        opts, args = getopt.getopt(sys.argv[1:],"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
        print('test.py -i <inputfile> -o <outfolder>')
        sys.exit(2)
    for opt, arg in opts:                                                       # Map arguments to variables
        if opt == '-h':                                                         # Help option for the function
            print('test.py -i <inputfile> -o <outfolder>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofolder"):
            outfolder = arg

    # Initialize class, fit model, and print results
    analyzer = TweetWordCount()
    analyzer.fit(inputfile)
    analyzer.print_results(outfolder)


if __name__ == "__main__":
    main()
