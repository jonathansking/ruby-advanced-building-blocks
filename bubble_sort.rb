def bubble_sort(array)
  arr_len = array.length
  begin
    swapped = false
    (1...arr_len).each do |i|
      if array[i-1] > array[i]
        array[i-1], array[i] = array[i], array[i-1]
        swapped = true
      end
    end
  end until swapped == false
  puts array.inspect
end


def bubble_sort_by(array)
  arr_len = array.length
  begin
    swapped = false
    (1...arr_len).each do |i|
      result = yield(array[i-1], array[i])
      if result > 0
        array[i-1], array[i] = array[i], array[i-1]
        swapped = true
      end
    end
  end until swapped == false
  puts array.inspect
end

puts "bubble_sort([4,3,78,2,0,2]):" 
puts bubble_sort([4,3,78,2,0,2])
puts "bubble_sort_by([\"hi\",\"hello\",\"hey\"]) {|left,right| left.length - right.length}:" 
puts bubble_sort_by(["hi","hello","hey"]) {|left,right| left.length - right.length}