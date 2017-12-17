# # Se pide:
# Crear una clase Course cuyo constructor reciba el nombre del curso y las fechas de inicio y término.
# Crear un método que permita leer el archivo y crear una instancia de la clase Course por línea del archivo.
# Crear métodos que permitan
# Saber qué cursos comienzan previo a una fecha entregada como argumento.
# Saber qué cursos finalizan posterior a una fecha entregada como argumento.
# En ambos el métodos argumento or defecto debe ser la fecha de hoy.
# Ambos métodos deben levantar una excepción si la fecha recibida es >= 2018-01-01.

require 'date'

class Course
  attr_accessor :name, :fecha_inicio, :fecha_termino
  def initialize(name, fecha_inicio, fecha_termino)
    @name = name
    @fecha_inicio = Date.parse(fecha_inicio)
    @fecha_termino = Date.parse(fecha_termino)
  end

  def cursos_previos_a(date)
    fecha_inicio < date ? true : false
  end

  def cursos_finalizan_posterior_a(date)
    fecha_termino > date ? true : false
  end

end

def metodo_uno
  file = File.open('cursos.txt', 'r')
  data = file.readlines
  file.close
  data.each do |line|
  arreglo_de_linea = line.split(', ').map { |w| w.chomp}
  puts Course.new(arreglo_de_linea[0], arreglo_de_linea[1], arreglo_de_linea[2])
  end
end

DateBegin = Date.parse('2017-05-05')
DateEnd = Date.parse('2017-08-13')

cursos = []
file = File.open('cursos.txt', 'r')
data = file.readlines
file.close

data.each do |line|
  name, fecha_inicio, fecha_termino = line.split(', ').map { |w| w.chomp}
  cursos << Course.new(name, fecha_inicio, fecha_termino)
end

cursos.each do |ele|
  puts "Los cursos que comienzan antes de la fecha #{DateBegin} es #{ele.name}" if ele.cursos_previos_a(DateBegin)
end

cursos.each do |ele|
  puts "Los cursos que finalizan posterior a #{DateEnd} es #{ele.name}" if ele.cursos_finalizan_posterior_a(DateEnd)
end
