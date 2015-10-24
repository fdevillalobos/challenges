# Rotates a Matrix counter-clockwise the amount of steps defined

require 'matrix'

class Matrix
    def []=(i, j, x)
        @rows[i] = j
        j = x
    end
end

def rotate_outter_ring(m)       # Takes in a Matrix
    rows = m.row_count
    cols = m.column_count

    # Convert Outter Ring in array
    m_array = m.row(0).to_a + m.column(-1)[1..-2] + m.row(-1).to_a.reverse + m.column(0).to_a.reverse[1..-2]
    rotate = m_array.shift
    m_array = m_array << rotate
    # puts "Shifted Vector: #{m_array}"
    row_first = m_array.shift(cols)
    col_last  = m_array.shift(rows - 2)
    row_last  = m_array.shift(cols).reverse
    col_first = m_array.reverse

    # At this point convert Matrix to Array Class
    m2 = *m     # m2 is class Array
    m2[0]  = row_first
    m2[-1] = row_last
    m2 = m2.transpose   # Cannot access cols so replace rows
    m2[0][1..-2] = col_first
    m2[-1][1..-2] = col_last
    m2 = m2.transpose   # Return the matrix to it's original form
    p "M2: #{m2}"

    # Get only the inside part of the matrix
    if m2.size > 2 then
        if m2[0].size > 2 then
            m_minor = m2[1...-1]    # Rejects first and last rows
            m_minor.each do |row|   # Slices first and last value (removes cols)
                row.slice!(0)
                row.slice!(-1)
            end

            # If the resulting inside matrix is at least 2 by 2
            # Call its self again to do the same process with the inner ring
            if m_minor.size > 1 then
                # puts "m_minor = #{m_minor}"
                puts "goes in"
                m_minor = rotate_outter_ring(Matrix[*m_minor])
            end
            m_minor.each_with_index do |row, idx|

                m_minor[idx].insert(0,  m2[idx+1][0])
                m_minor[idx].insert(-1, m2[-2-ix][0])
            end
            # m2[1..-2] = m_minor
            puts m_minor
        end
    end
    p m2
    return Matrix[*m2]
end


size = gets.chomp.split(" ").map{|i| i.to_i}
r = size[2]

m = Matrix[]

(0...size[0]).each do |row|
    r = gets.chomp.split(" ").map{ |i| i.to_i }
    m = Matrix.rows(m.to_a << r)
end

res = rotate_outter_ring(m)
puts res






###### PYTHON SOLUTION


import numpy as np

def rotate_outter_ring(m, r):
    print("Loop")
(rows, cols) = m.shape

# Convert Outter Ring in array
m_array = m[0,:]
if
m_array = np.append(m[0,:], m[1:-1,-1])
m_array = np.append(m_array, np.fliplr([m[-1,:]])[0])
m_array = np.append(m_array, np.fliplr([m[1:-1,0]])[0])
m_array = np.roll(m_array,-r)
# Replace necessary rows and columns
m[0,:] = m_array[0:cols]
m[1:-1,-1] = m_array[cols:cols+rows-2]
m[-1,:] = np.fliplr([m_array[cols+rows-2:2*cols+rows-2]])[0]
m[1:-1,0] = np.fliplr([m_array[-(rows-2):len(m_array)]])[0]

print(m)

# Get only the inside part of the matrix
if rows > 2 and cols > 2:
    m_minor = m[1:-1,1:-1]    # Rejects first and last rows
print(m_minor)

# If the resulting inside matrix is at least 2 by 2
# Call its self again to do the same process with the inner ring
if m_minor.shape[0] > 1 and m_minor.shape[1] > 1:
    m_minor = rotate_outter_ring(m_minor, r)
m[1:-1,1:-1] = m_minor
print(m_minor)

return m


# MAIN

size = map(int, raw_input().split())
r = size[2]
m = np.zeros([size[0], size[1]])

for i in range(0,size[0]):
    m[i,:] = map(int, raw_input().split())

    res = rotate_outter_ring(m, r)
    print(res)