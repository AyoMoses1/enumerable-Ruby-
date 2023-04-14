module MyAll
  def my_all?(exp = nil)
    if block_given?
      @list.each { |x| return false unless yield(x)}
      return true
    end
    if exp.is_a? Regexp
      @list.each { |x| return false unless (exp.match?(x.to_s))}
      return true
    end
    if exp.is_a? Class
      @list.each { |x| return false unless x.is_a?(exp) }
      return true
    end
    if exp
      @list.each { |x| return false unless x == exp }
      return true
    end
    @list.each { |x| return false unless x }
    true
  end
end