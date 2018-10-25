require 'pry'

#Monkey patching you bad boy
class Array

  def quicksort
    return [] if empty?
    #pivot returns a random array element
    pivot = delete_at(rand(size))

    #left, right = partition(&pivot.method(:>))
    left, right = partition { |x| x < pivot }

    # splat will also flatten your subarrays into arrays, making sure that your return value is a 1-dimensional array
    return [*left.quicksort, pivot, *right.quicksort]
  end

end

def make_array
  i = 0
  array = []

  while i < 1000000
    num = rand(1000000)
    array << num
    i += 1
  end
  array
end

array = make_array

print array.quicksort


#quicksort on average has a time complexity of T(n) = O(n log n)
#This is known as quasilinear time, fastest possible for comparison sorts
#worst case it has T(n) = O(n^2) (sub-quadratic time)

#Quicksort has a worst case space complexity of O(log n) (logarithmic) (very good)


#A binary search only touches a small number of elements. If there's a billion
#elements, the binary search only touches ~30 of them.
#A quicksort touches every single element, a small number of times.
#If there's a billion elements, the quick sort touches all of them,
#about 30 times: about 30 billion touches total.
