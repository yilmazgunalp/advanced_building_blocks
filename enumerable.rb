module Enumerable
  def my_each
    if self.class == Array
      for i in 0..size - 1
        yield (self[i])
      end
    elsif self.class == Hash
      keys = self.keys
      for i in 0..keys.size - 1
        yield [keys[i], self[keys[i]]]
      end
        end
  end

  def my_each_with_index
    for i in 0..size - 1
      yield [self[i], i]
     end
  end

  def my_select
    if self.class == Array
      result = []
      my_each do |x|
        result << x if yield(x)
      end
      result
    elsif  self.class == Hash
      resulthash = {}
      my_each do |x, y|
        resulthash[x] = y if yield(x, y)
      end
      resulthash
            end
  end

  def my_all?
  result = true
  if self.class == Array
    my_each do |x|
      result = false unless yield(x)
    end
    return result
  elsif self.class == Hash
    my_each do |x, y|
      result = false unless yield(x, y)
    end
    return result
      end
  end


  def my_any?
  result = false
  if self.class == Array
    my_each do |x|
      result = true if yield(x)
    end
    return result
  elsif self.class == Hash
    my_each do |x, y|
      result = true if yield(x, y)
    end
    return result
     end
 end


  def my_none?
    result = true
    if self.class == Array
      my_each do |x|
        result = false if yield(x)
      end
      return result
    elsif self.class == Hash
      my_each do |x, y|
        result = false if yield(x, y)
      end
      return result
       end
 end

  def my_count(arg = nil)
    if arg.nil? && !block_given?
      size
    elsif block_given?
      count = 0
      my_each do |x|
        count += 1 if yield(x)
      end
      count
    else
      countz = 0
      my_each do |x|
        countz += 1 if arg === x
      end
      countz
    end
  end

  def my_map(xy = nil)
    result = []
    my_each do |x|
      if x.is_a? Proc
        result << xy.call
      else
        result << yield(x) if block_given?
    end
    end
    result
 end

  def my_inject(obj = 0)
    result = if obj.is_a? Integer
               self[obj]
             else
               obj
         end
    my_each_with_index do |x, i|
      next if obj.is_a?(Integer) && obj > i - 1
      result = yield([result, x])
    end
    result
 end
    end

def multiply_els(arr)
  arr.my_inject { |r, x| r * x }
end

# EXAMPLES
puts [1, 3, 8, 7].my_map { |y| y * 2 }
puts [2, 4, 5].my_inject { |r, x| r * x }
hash = [[:first_name, 'Shane'], [:last_name, 'Harvie']].my_inject({}) do |result, element|
  result[element.first] = element.last
  result
end
[1, 2, 3, 4].my_inject { |result, element| result + element }
array = [1, 2, 3, 4, 5, 6].my_inject([]) do |result, element|
  result << element.to_s if element.even?
  result
end
multiply_els [2, 4, 5]
