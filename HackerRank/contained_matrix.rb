# Find Matrix Inside another

require 'matrix'

def retrieve_matrix()
    m = Matrix[]
    size_m = gets.chomp.split(" ")
    size_m = size_m.map{ |i| i.to_i }       # Get size (rows, cols) of the matrix

    # Loop through each row and append it to the matrix
    (0...size_m[0]).each do |row|
        r = gets.chomp.split(//)
        r = r.map{ |i| i.to_i }
        m = Matrix.rows(m.to_a << r)
    end
    return m
end

def find_submatrix(m1, m2)
    '''
    Finds submatrix m2 inside m1 and returns first index or FALSE
    '''
    found = false
    indices = []
    m1_size = [m1.row_count, m1.column_count]
    m2_size = [m2.row_count, m2.column_count]

    m1.each_with_index do |e, row, col|     # e => value, row => row #, col => col #
        # if e == m2[0,0] then        # Next line makes it a lot quicker
        if e == m2[0,0] and m1[row,col+1] == m2[0,1] and m1[row,col+2] == m2[0,2] then
            if (row + m2_size[0]) <= m1_size[0] and (col + m2_size[1]) <= m1_size[1] then
                # puts "#{e} #{row} #{col}: Passed Size Test"
                if (m1.minor(row...row+m2_size[0], col...col+m2_size[1]) == m2) then
                    found = true
                    indices = [row, col]
                    break
                end
            end
        end
    end

    # p indices
    if found == true then
        return indices
    else
        return found
    end

end



test_cases = gets.chomp.to_i        # Number of test cases
g = Matrix[]
p = Matrix[]

(0...test_cases).each do |test|
    # puts "New Test Case"
    g = retrieve_matrix
    p = retrieve_matrix
    # puts g.row_count
    # puts p.row_count
    # puts "\n"
    found = find_submatrix(g, p)
    if found == false then
        puts "NO"
    else
        puts "YES"
    end
end
