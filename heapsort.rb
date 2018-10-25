require 'pry'


def heapify(arr, n, i)
  # think of heapify as building one node on your tree (one parent, two children)

  # finding the largest between root (i), left child (l), right child (r)
  # set largest to i and then compare it to children, resetting the largest if
  # either of the children are larger

  largest = i
  l = 2 * i + 1
  r = l + 1

  if l < n && arr[l] > arr[largest]
    largest = l
  end

  if r < n && arr[r] > arr[largest]
    largest = r
  end

  # swap and continue heapifying if the root is not the largest
  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    heapify(arr, n, largest)
  end
  arr
end

def heapsort(array)
  # i here will be the index of the LAST PARENT
  # k will be the
  n = array.length
  i = n / 2 - 1
  k = n - 1

  # Initially build your max heap from your array
  # Start at the BOTTOM and heapify UP
  while i >= 0
    heapify(array, n, i)
    i -= 1
  end

  # loop will switch the root with the last child. the root will be the biggest
  # because it was at the top of the max heap we built. So we put it at the end
  # of our array.
  #
  # then it will make a max heap out of all but the last number, which we
  # know to be the largest because it was at the top of our max heap
  #
  # next we subtract 1 from k (shrinking what we are considering the array elements
  # in our heap) and repeat the process on the smaller heap.
  while k >= 0
    array[0], array[k] = array[k], array[0]
    heapify(array, k, 0)
    k -= 1
  end
  array
end


def make_array
  i = 0
  array = []

  while i < 1000
    num = rand(1000)
    array << num
    i += 1
  end
  array
end

# my_arr = [2, 4, 3, 4, 5, 6, 7, 8, 9]
# print heapsort(my_arr)

new_arr = make_array
puts heapsort(new_arr)
