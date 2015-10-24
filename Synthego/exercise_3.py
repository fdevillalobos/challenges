# Passes test

# def tsplit(s, sep):
#     stack = [s]
#     for char in sep:
#         pieces = []
#         for substr in stack:
#             pieces.extend(substr.split(char))
#         stack = pieces
#     return stack

def solution(S):
    sentences = S.split('.')
    sentences = sentences.split('?')
    sentences = sentences.split('!')
    print sentences
    # separators = ['.','?','!']
    # text = [S]
    # for sep in separators:
    #     for word in text:
    #         pieces.extend(word.split(sep))
    #     text = pieces
    #
    # print text

    # Split sentences and count them
    # max_words = 0
    # for sentence in sentences:
    #     print sentence.split()
    #     num_words = len(sentence.split())
    #     if num_words > max_words:
    #         max_words = num_words
    # print max_words



# solution('We are the champions. And we are the best. Nodoby is ever going to win against us.')
solution('We are the  champions. How are you doing?! Are you ok? Yes. thanks.')
