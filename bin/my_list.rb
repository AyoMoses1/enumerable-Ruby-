require_relative './my_any'
require_relative './my_all'

class MyList
  include MyAny
  include MyAll
  def initialize(*arr)
    @list = arr
  end
end

list = MyList.new(1, 2, 3, 4)
list_all = MyList.new(1, 1, 1)
words = MyList.new('no', 1)
test_word = MyList.new('test')
empty = MyList.new

list.my_any? { |x| x == 1 }
list.my_any?(Numeric)
list.my_any?(String)
empty.my_any?
words.my_any?(/test/)
words.my_any?(/no/)

list.my_all? { |x| x == 1 }
list_all.my_all? { |x| x == 1 }
list_all.my_all? { |x| x == 2 }
list.my_all?(Numeric)
list.my_all?(String)
empty.my_all?
words.my_all?(/test/)
test_word.my_all?(/test/)
