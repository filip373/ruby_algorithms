def ceasar_cipher text, shift
  encrypted = ''
  text.each_byte do |b|
    if b >= 'A'.ord && b <= 'Z'.ord
      enc = b + shift
      if enc > 'Z'.ord
        enc = 'A'.ord + ((enc - 'Z'.ord - 1) % ('Z'.ord - 'A'.ord))
      end
    elsif b >= 'a'.ord && b <= 'z'.ord
      enc = b + shift
      if enc > 'z'.ord
        enc = 'a'.ord + ((enc - 'z'.ord - 1) % ('z'.ord - 'a'.ord))
      end
    else
        enc = b
    end
    encrypted << enc
  end
  return encrypted
end

string = 'What a string!'
puts ceasar_cipher string, 5