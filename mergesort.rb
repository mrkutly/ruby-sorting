def merge(left, right)
  array = []
  left_idx = 0
  right_idx = 0

  while right_idx < right.length || left_idx < left.length
    if right_idx >= right.length || (left_idx < left.length && left[left_idx] < right[right_idx])
      array << left[left_idx]
      left_idx += 1
    else
      array << right[right_idx]
      right_idx += 1
    end
  end
  return array
end

def mergesort(array)
  return array if array.length <= 1

  mid = array.length / 2 - 1
  left = mergesort(array[0..mid])
  right = mergesort(array[mid + 1..-1])
  return merge(left, right)
end


def make_array
  i = 0
  array = []

  while i < 10000
    num = rand(1000)
    array << num
    i += 1
  end
  array
end

array = make_array

print mergesort(array)
