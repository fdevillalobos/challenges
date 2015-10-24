# Calculate fine between two dates

require 'date'

def year_diff(date_1, date_2)
  return (date_1.year - date_2.year).abs
end

def num_months_diff(date_1, date_2)
  return ((date_2.year * 12 + date_2.month) - (date_1.year * 12 + date_1.month)).abs
end

def num_days_diff(date_1, date_2)
  return (date_2 - date_1).abs
end

actual_return = gets.chomp
expected_return = gets.chomp

actual_return = actual_return.split(" ")
expected_return = expected_return.split(" ")


exp = Date.new(expected_return[2].to_i, expected_return[1].to_i, expected_return[0].to_i)
act = Date.new(actual_return[2].to_i, actual_return[1].to_i, actual_return[0].to_i)

fee = 0
if exp.year == act.year then
    if exp.mon == act.mon then
        late_days = 0
        if act.mday > exp.mday then
            late_days = (act - exp).to_i.abs
        end
        fee = late_days.to_i * 15
    else
        late_months = 0
        if act.month > exp.month then
            late_months = (act.month - exp.month).to_i
        end
        fee = late_months * 500
    end
else
    if act.year > exp.year then
        fee = 10000
    end
end

puts fee
