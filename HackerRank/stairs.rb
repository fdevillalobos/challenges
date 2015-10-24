# Creates staircase with # signs from input

def step(length, step_num)
  str = ""
  str << " "*(length - step_num)
  str << "#"*(length - str.size)
  return str
end


stair_len = gets.chomp.to_i

(0...stair_len).each do |i|
    puts step(stair_len, i+1)
end
