module Enumerable
  def all?
    result = true

    each { |item| result = false unless yield item }

    result
  end

  def any?
    result = false

    each { |item| result = true if yield item }

    result
  end

  def filter
    result = []

    each { |item| result.push(item) if yield item }

    result
  end
end


require_relative 'enumerable'

class List
  include Enumerable

  def initialize(*list)
    @list = list
  end

  def each(&block)
    @list.each(&block)
  end
end

list = List.new(1, 2, 3, 4)

puts(list.all? { |e| e < 5 })
puts(list.all? { |e| e > 5 })
puts(list.any? { |e| e == 2 })
puts(list.any? { |e| e == 5 })
puts(list.filter(&:even?))