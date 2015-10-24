# Convert AMPM time to 24h time

def ampm_to_24(time_str)
  ampm = time_str[-2..-1]
  time_ = time_str[0...-2].split(":")
  hour = time_.first
  minutes = time_[1]
  seconds = time_[2]
  if ampm == "PM" and hour != "12" then
      hour = hour.to_i + 12
      hour = hour.to_s
  end
  if ampm == "AM" and hour == "12" then
      hour = "00"
  end
  return [hour, minutes, seconds].reject(&:empty?).join(':')
end

# MAIN
''' Input: 07:45:05AM '''
time_raw = gets.chomp
puts ampm_to_24(time_raw)
