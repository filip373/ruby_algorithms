def ceasar_cipher text, shift
  up_range = 'A'.ord..'Z'.ord
  down_range = 'a'.ord..'z'.ord
  encrypted = ''

  text.each_byte do |b|
    if up_range === b
      enc = b + shift
      if enc > up_range.last || enc < up_range.first
        enc = up_range.first + (enc - up_range.last - 1)
      end
    elsif down_range === b
      enc = b + shift
      if enc > down_range.last || enc < down_range.first
        enc = down_range.first + (enc - down_range.last - 1)
      end
    else
        enc = b
    end
    encrypted << enc.chr
  end
  return encrypted
end

string = 'What a string!'
puts ceasar_cipher string, 19