# Time to words

def number_to_words(num)
  '''
  Converts a number between 0 and 30 included
  to notation of reading time
  '''
  n_d = num / 10
  n_u = num % 10

  case n_u
  when 0 then min = ""
  when 1 then min = "one"
  when 2 then min = "two"
  when 3 then min = "three"
  when 4 then min = "four"
  when 5 then min = "five"
  when 6 then min = "six"
  when 7 then min = "seven"
  when 8 then min = "eight"
  when 9 then min = "nine"
  end

  case n_d
  when 1 then
      case n_u
      when 0 then min = "ten"
      when 1 then min = "eleven"
      when 2 then min = "twelve"
      when 3 then min = "thirteen"
      when 4 then min = "fourteen"
      when 5 then min = "quarter"
      when 6 then min = "sixteen"
      when 7 then min = "seventeen"
      when 8 then min = "eighteen"
      when 9 then min = "nineteen"
      end
  when 2 then
      if min != ""then
          min = "twenty " + min
      else
          min = "twenty"
      end
  when 3 then min = "half"
  end

  if n_d == 0 and n_u == 0 then
      min = "o'clock"
  end

  return min
end


def time_to_words(hh, mm)
  '''
  Converts a numeral time to words with correct syntax
  '''
  # See if we are something PAST, or something TO
  if mm > 30 then
      prep = "to"
      mm = 60 - mm
      hh += 1           # If we are TO, we have to add one to hour
  elsif mm > 0
      prep = "past"
  else
      prep = ""         # If we are o'clock we don't need preposition
  end

  min = number_to_words(mm)

  if mm > 1 then
      min_prep = "minutes"
  elsif mm == 1 then
          min_prep = "minute"
  else
      min_prep = ""
  end

  hour = number_to_words(hh)

  # Decide the format in how to output the time
  if min == "o'clock" then
      return [hour, min].reject(&:empty?).join(" ")
  elsif min == 'half' or min == 'quarter' then
      return [min, prep, hour].reject(&:empty?).join(' ')
  else
      return [min, min_prep, prep, hour].reject(&:empty?).join(' ')
  end
end

# MAIN
hh = gets.chomp.to_i
mm = gets.chomp.to_i
time = time_to_words(hh, mm)
puts time
