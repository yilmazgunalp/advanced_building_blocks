# Project 1 Bubble Sort
# -----------------
def bubble_sort(arr)
  itr_num = 1
loop do
  no_change = true
puts "**running iteration #{itr_num} **"
  arr.each_with_index do |item, index|
    # puts "&&& at:#{item} of index:#{index}"
    next unless item !=arr.last
      if item > arr[index + 1]
        arr[index] = arr[index + 1]
      arr[index + 1] = item
      no_change = false
      end
  end
break   if no_change
itr_num+ = 1
end
puts  arr.inspect
end

bubble_sort([4, 3, 78, 2, 0, 2])
bubble_sort([0, 2, 2, 3, 4, 78, 5, 18, 1, 13, -1].sort.reverse)

# Project 2 bubble_sort_by
# -----------------

def bubble_sort_by(arr)
  loop do
    changed = true
  x = 0
  until x == arr.length - 1
    puts '***inside UNTIL***'
    result = yield(arr[x], arr[x + 1])
    if result > 0
      temp = arr[x]
    arr[x] = arr[x + 1]
    arr[x + 1] = temp
    changed = false
  end
    x += 1
  end
  break if changed
  end
  arr.inspect
end

# EXAMPLES
# -----------------

bubble_sort_by(['hi', 'hello', 'hey']) do |left, right|
      left.length - right.length
end
bubble_sort_by ([4, 3, 78, 2, 0, 2]) { |a, b| a <=> b }
