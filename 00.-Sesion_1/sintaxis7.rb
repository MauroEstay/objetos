class Product
  attr_reader :name, :sizes
  def initialize(name, *sizes, xs)
    @name = name
    @sizes = sizes.map(&:to_i)
  end

  def average
    @sizes.inject(&:+) / @sizes.size.to_f
  end

  def salida
    "#{@name}, #{@sizes.join(", ")}"
  end
end

products_list = []
data = []
File.open('catalogo.txt', 'r') { |file| data = file.readlines}


data.each do |prod|
  ls = prod.split(', ')
  products_list << Product.new(*ls)
end

File.open('nuevo_catalogo.txt', 'w')
products_list.each do |elemt|
   open('nuevo_catalogo.txt', 'a'){|e| e.puts elemt.salida}
end
