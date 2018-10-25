def bubble_sort(array)
  n = array.length

  loop do
    swapped = false
    (n-1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end
    break if not swapped
  end

  array
end

a = [1, 5, 4, 6, 3, 1, 1, 0, 7 , 86, 45, 7, 1, 0]

print bubble_sort(a)
