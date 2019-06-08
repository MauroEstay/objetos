class Product
  attr_reader :name
  def initialize(name, *sizes)
    @name = name
    @sizes = sizes.map(&:to_i)
  end

  def average
    @sizes.inject(&:+) / @sizes.size.to_f
  end
end

products_list = []
data = []
File.open('catalogo.txt', 'r') { |file| data = file.readlines}

data.each do |prod|
  ls = prod.split(', ')
  products_list << Product.new(*ls)
end


products_list.each do |product|
  # puts product.name
  # puts product.average
  puts "El promedio de #{product.name} es #{product.average}"
end
