# Utopian Tree
# Tree grows in first cycle doble size, and 1 m in next cycle.
# Find size after n cycles

def utopian_odd(h)
    return h * 2
end

def utopian_even(h)
    return h+1
end

def utopian_tree(cycles)
    h = 1
    cycle = 1
    while cycle <= cycles do
        # puts "Cylce: #{cycle}"
        if cycle.odd? then
            h = utopian_odd(h)
        else
            h = utopian_even(h)
        end
        # puts h
        cycle += 1
    end
    return h
end


test_cases = gets.chomp.to_i

(0...test_cases).each do |tree|
    cycles = gets.chomp.to_i
    # puts "Test Case with #{cycles} cycles"
    height = utopian_tree(cycles)
    puts height
end
