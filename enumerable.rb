module Enumerable

  def my_each
    self.size.times do |time|
      yield self.to_a[time]
    end
  end

  def my_each_with_index
    self.size.times do |time|
      yield self.to_a[time], time
    end
  end

  def my_select
    arr = []
    self.my_each do |elem|
      arr.push elem if yield elem
    end
    return arr
  end

  def my_all?
    self.my_each do |elem|
      return false unless yield elem
    end
    return true
  end

  def my_none?
    self.my_each do |elem|
      return false if yield elem
    end
    return true
  end

  def my_count obj = (no_arg = true), &block
    unless no_arg
      return self.my_select do |elem|
        elem == obj
      end.size
    end
    if block_given?
      return self.my_select(&block).size
    else
      return self.size
    end
  end

  def my_map
    arr = []
    self.each do |elem|
      arr.push yield elem
    end
    return arr
  end

  def my_inject proc = (no_proc = true), initial = self[0]
    memo = initial
    return memo if no_proc
    self.each do |elem|
      memo = proc.call memo, elem
    end
    if block_given?
      memo2 = initial
      self.each do |elem|
        memo2 = yield memo2, elem
      end
      return memo, memo2
    else
      return memo
    end
  end

end

def multiply_els arr
  proc = Proc.new do |memo, elem|
    memo *= elem
  end
  return arr.my_inject(proc, 1) { |m,e| m *= e }
end
