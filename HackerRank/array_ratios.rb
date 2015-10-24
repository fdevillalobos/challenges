# Return ratios for # of zeros, # of positives and # of negatives in an array

def positive_ratio(array)
    pos_count = array.select { |i| i>0 }.count
    return pos_count.to_f/array.count.to_f
end

def negative_ratio(array)
    neg_count = array.select { |i| i<0 }.count
    return neg_count.to_f/array.count.to_f
end

def zero_ratio(array)
    zero_count = array.select { |i| i==0 }.count
    return zero_count.to_f/array.count.to_f
end


arr_len = gets.chomp.to_i
input = gets.chomp.split(" ")
arr = []
input.each{ |i| arr.push(i.to_i) }
pos_ratio = positive_ratio(arr)
neg_ratio = negative_ratio(arr)
z_ratio = zero_ratio(arr)
puts "%0.3f" % pos_ratio
puts "%0.3f" % neg_ratio
puts "%0.3f" % z_ratio


#h = Hash.new
#h["even"] = ak.select {|x| x.even? && x > 0}.count
#h["odd"] = ak.select {|x| x.odd? && x > 0}.count
#h["positive"] = ak.select {|x| x > 0}.count
#h["negative"] = ak.select {|x| x < 0}.count
