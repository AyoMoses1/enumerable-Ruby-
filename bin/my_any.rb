module MyAny
  def my_any?(exp = nil)
    if block_given?
      @list.each { |x| return true if yield(x) }
      return false
    end
    if exp.is_a? Regexp
      @list.each { |x| return true if exp.match?(x.to_s) }
      return false
    end
    other_any(exp)
  end

  def other_any(exp)
    if exp.is_a? Class
      @list.each { |x| return true if x.is_a?(exp) }
      return false
    end
    if exp
      @list.each { |x| return true if x == exp }
      return false
    end
    last_any
  end

  def last_any
    @list.each { |x| return true if x }
    false
  end
end
