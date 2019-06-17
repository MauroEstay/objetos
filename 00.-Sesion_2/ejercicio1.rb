class Table
  attr_reader :name
  def initialize(name, *collection)
    @name = name
    @collection = collection.map(&:to_i)
  end

  def higher
    @collection.max
    # puts "Para la #{@name} la mayor recaudacion es #{@collection.max}"
  end

  def day
  @collection.index { |x| x == @collection.max } + 1
  # @collection.index { |x| x == self.higher } + 1
  end

  def average
    @collection.inject(&:+) / @collection.size.to_f
  end
end

  file = File.open('casino.txt', 'r')
  data = file.readlines
  file.close

  table_list = []
  data.each do |m|
    ls = m.split(', ')
    table_list << Table.new(*ls)
  end


table_list.each do |mesa|
  puts "El dia #{mesa.day}, en la #{mesa.name} la mayor recaudacion es #{mesa.higher}"
end

averages = table_list.map(&:average)#promedio de cada mesa

puts "El promedio de todas las mesas es #{averages.inject(:+) / averages.size}"#promedio de todas las mesas
