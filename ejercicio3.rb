# Se tiene un array que contiene los números de una ruleta.
#
# r = (1..10).to_a
# Se pide:
#
# Crear una clase llamada Roulette.
#
# Crear un método de instancia llamado play que reciba como argumento un número al cual se está apostando. Luego debe tomar un valor -del array- al azar y compararlo con el número al cual se apostó.
#
# Crear un método de instancia que:
#
# Debe almacenar el número generado al azar en un archivo llamado roulette_history.txt
#
# Si el número al cual se apostó corresponde al generado al azar entonces, debe además almacenar ese número en un archivo llamado winners.txt
#
# Crear un método que lea el archivo rouletter_history.txt y retorne el valor que más ha generado la ruleta históricamente.


class Roulette
  def play(numero_apostado)
    r = (1..10).to_a
    largo = r.length
    numero_azar = rand(largo)
    puts "El número al azar fue el #{numero_azar}"
    puts "El número apostado en esta jugada fue el #{numero_apostado}"
    puts 'Felicitaciones, hiciste un Match' if numero_apostado == numero_azar

    file = File.open('roulette_history.txt', 'w')
    file.puts numero_azar
    file.close
  end
end

pedro = Roulette.new
print pedro.play(4)
