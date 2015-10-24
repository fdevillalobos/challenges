# Sum all elements in an array from input

def sum_array(arr)
    return arr.reduce( :+ )
end

arr_len = gets.chomp.to_i
input = gets.chomp.split(" ")
arr = []
input.each{ |i| arr.push(i.to_i) }
res = sum_array(arr)
puts res

# Sample input
# 6                         # Number of elements to go through
# 0 1 2 3 4 5 6             # Acutal array
