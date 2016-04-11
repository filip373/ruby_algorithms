def bubble_sort arr
  sorted = arr.dup
  sorted.length.times do |time|
    sorted.each_with_index do |num, index|
      if index < sorted.length - 1 - time && num > sorted[index + 1]
          sorted[index], sorted[index + 1] = sorted[index + 1], sorted[index]
      end
    end
  end
  return sorted
end

p bubble_sort([4,3,78,2,0,2,7,3,7,3,2,1,8,23,4,7,9,3,46,5,2,4,7,23,6,8,8,2,3,7,8,3,5,3])
