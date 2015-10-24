#!/usr/bin/env bash

# '''
# Shell command prompt help
#
#   Options:
#     1) -i or --ifile <tweets_input_file_relative_path>  --> -i ./tweet_input/tweets.txt
#     2) -o or --ofolder <output_folder_relative_path>    --> -o ./tweet_output
#     3) -h   --> Displays help options for the function
# '''

python3 ./src/words_tweeted.py -i ./tweet_input/tweets.txt -o ./tweet_output/
