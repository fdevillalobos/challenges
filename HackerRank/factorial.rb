# Factorial Function

def factorial(n)
    n == 0? 1:n * factorial(n-1)
end

number = gets.chomp.to_i
puts factorial number
