# Passes Test

def solution(N):
    # write your code in Python 2.7
    for i in range(N):
        j = i+1
        out = ''
        flag = 0

        if (j % 3) == 0:
            out += 'Fizz'
            flag = 1
        if (j % 5) == 0:
            out += 'Buzz'
            flag = 1
        if (j % 7) == 0:
            out += 'Woof'
            flag = 1
        if flag == 0:
            out = j
        sys.stdout.write(str(out)+'\n')

solution(24)
