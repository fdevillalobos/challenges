# Return the absolute value of the difference of the diagonals of a matrix

require 'matrix'

def cross_diag(mat)
    '''
    Method which calculates
    upper-right to lower-left diagonal of a matrix
    Input: Matrix class. Square.
    Output: Array with diagonal
    '''
    cross_d = []
    j = mat.column_count
    (0...mat.row_count).each do |i|
      j -= 1
      cross_d.push(mat[i,j])        # Counts from last column, back
    end
    return cross_d
end

def abs_diag_diff(mat)
  '''
  Method that calculates the absolute value
  of the difference of the two diagonals in a square matrix
  Input: Square matrix of class Matrix
  Output: integer or float
  '''
  diag1 = mat.each(:diagonal).to_a
  diag2 = cross_diag(mat)
  diff = (diag1.reduce( :+ ) - diag2.reduce( :+ )).abs
  return diff
end

# Main
'''
Test Case:
3           => Number of rows and columns in the matrix
11 2 4      => Matrix in rows
4 5 6
10 8 -12
'''
matrix_dim = gets.chomp.to_i      # Gets the dimensions of the matrix
m = Matrix[]                      # Initialize matrix

(0...matrix_dim).each do |i|            # Get each row separately
  input = gets.chomp.split(" ")         # Convert string into array of strings
  arr = []
  input.each{ |j| arr.push(j.to_i) }    # Convert array of strings into array
  m = Matrix.rows(m.to_a << arr)        # Append row to the Matrix
end
diff = abs_diag_diff(m)
puts diff
