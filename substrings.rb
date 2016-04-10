def substrings string, dictionary
  found = Hash.new(0)
  string_arr = string.split
  string_arr.each do |s|
    dictionary.each do |d|
      if s.downcase.include? d.downcase
        found[d.downcase] += 1
      end
    end
  end
  return found
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)
