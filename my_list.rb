require_relative 'my_enumerable'

class MyList
  include myEnumerable

  def initialize( *lists ) 
    @list = lists
  end

  def each(&block)
    @list.each(&block)
  end

end

