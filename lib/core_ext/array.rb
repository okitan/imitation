class Array
  def rand
    self.at(Kernel.rand(self.size))
  end

  def rand?
    (self + [ '' ]).rand
  end

  def subset(count = nil)
    array = self.dup
    if (count ||= Kernel.rand(array.size).next) > array.size / 2
      (array.size - count).times { array.delete_at(Kernel.rand(array.size)) }
      array
    else
      count.times.inject([]) {|result, i| result << array.delete_at(Kernel.rand(array.size)) }
    end
  end

  def subset?
    (i = Kernel.rand(self.size.next)) == self.size ? [] : subset(i.next)
  end
end
