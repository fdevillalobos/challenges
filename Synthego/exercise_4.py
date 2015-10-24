# Test 4 Passes Test

def solution(A):
    n = len(A)
    m = len(A[0])
    # print n
    # print m

    saddle_points = 0
    for i in xrange(1, m-1):
        for j in xrange(1, n-1):
            print 'Pos:',i,j
            print 'Actual Value:',A[i][j]
            val = A[i][j]
            com_mat = [[val,val,val],[val,val,val],[val,val,val]]
            # print 'Substract Matrix:', com_mat
            res = [[A[i-1][j-1]-val,A[i-1][j]-val,A[i-1][j+1]-val], [A[i][j-1]-val,A[i][j]-val,A[i][j+1]-val], [A[i+1][j-1]-val,A[i+1][j]-val,A[i+1][j+1]-val]]
            print res       # Hasta aca bien
            if res[0][1] > 0 and res[2][1] > 0 and res[1][0] < 0 and res[1][2] < 0:
                saddle_points += 1
            if res[0][1] < 0 and res[2][1] < 0 and res[1][0] > 0 and res[1][2] > 0:
                saddle_points += 1
    print 'Saddle Points:',saddle_points


solution([[0, 1, 9, 3], [7, 5, 8, 3], [9, 2, 9, 4], [4, 6, 7, 1]])
