module Enumerable
  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    for i in self
      yield(i, self.index(i))
    end
  end

  def my_select
    new_array = []
    for i in self
      new_array << i if yield(i) 
    end
    return new_array
  end

  def my_all?
    for i in self
      el = i
      el = yield(i) if block_given?
      if [nil, false].include?(el) 
        return false
      end
    end
    return true
  end

  def my_any?
    for i in self
      el = i
      el = yield(i) if block_given?
      unless [nil, false].include?(el) 
        return true
      end
    end
    return false
  end

  def my_none?
    for i in self
      el = i
      el = yield(i) if block_given?
      return false if el == true
    end
    return true
  end

  def my_count(arg=nil)
    count = 0
    for i in self
      if block_given?
        count += 1 if yield(i) == true
      elsif arg != nil
        count += 1 if arg == i
      else
        count += 1
      end
    end
    return count
  end

  def my_map(proc=nil)
    new_array = []
    for i in self
      if proc && block_given? 
        self.my_each { |i| new_array << proc.call(yield(i)) }
      elsif block_given?
        self.my_each { |i| new_array << yield(i) }
      else
        self.my_each { |i| new_array << proc.call(i) }
      end
    end
    return new_array
  end
end