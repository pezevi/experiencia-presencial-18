# El archivo casino.txt contiene las recaudaciones de 4 días de un casino separadas por mesa de juego.
#
# Mesa 1, 90, 60, 10, 30
# Mesa 2, 40, 34, 77, 11
# Mesa 3, 34, 86, 55, 91
# Mesa 4, 67, 93, 43, 87
# Se pide:
#
# Crear una clase Table cuyo constructor reciba el nombre de la mesa y las recaudaciones correspondientes de cada día.
#
# Hint: El constructor debe recibir 5 argumentos. Uno para el nombre de la mesa y los demás para cada recaudación correspondiente a esa mesa.
# Crear un método que permita leer el archivo e instanciar un objeto de la clase Table por cada línea del archivo.
#
# Crear métodos que permitan:
#
# Conocer el mayor valor recaudado, por mesa, y el nombre de la mesa y día corresponde (día 1, día 2, día 3 o día 4).
#
# Calcular el promedio total de lo recaudado por todas las mesas en todos los días.
#

class Table
  attr_accessor :mesa, :rec1, :rec2, :rec3, :rec4
  def initialize(mesa, rec1, rec2, rec3, rec4)
    @mesa = mesa
    @rec1 = rec1.to_i
    @rec2 = rec2.to_i
    @rec3 = rec3.to_i
    @rec4 = rec4.to_i
  end
  def mayor_valor
    [@rec1, @rec2, @rec3, @rec4].max
  end
  def average
    (@rec1 + @rec2 + @rec3 + @rec4)/4
  end
end

def metodo_1
  file = File.open('casino.txt', 'r')
  data = file.readlines
  file.close

  data.each do |line|
    arreglo_de_linea = line.split(', ').map { |w| w.chomp}
    puts Table.new(arreglo_de_linea[0], arreglo_de_linea[1], arreglo_de_linea[2], arreglo_de_linea[3], arreglo_de_linea[4])
  end
end

tables = []
file = File.open('casino.txt', 'r')
data = file.readlines
file.close

data.each do |line|
  mesa, rec1, rec2, rec3, rec4 = line.split(', ').map { |w| w.chomp}
  tables << Table.new(mesa, rec1, rec2, rec3, rec4)
end

tables.each do |element|
  puts element.mesa
  puts element.mayor_valor
end


tables.each do |element|
  puts element.mesa
  puts element.average
end
