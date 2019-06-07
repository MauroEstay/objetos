propiedades = {nombre: 'Beethoven', raza: 'San Bernardo', color: 'Café'}

class Dog
  def initialize(hash)
    @nombre = nombre
    @raza = raza
    @color = color
  end
  def ladrar
    puts "#{nombre} está ladrando!"
  end
end

perro = Dog.new(propiedades)
puts perro.ladrar
