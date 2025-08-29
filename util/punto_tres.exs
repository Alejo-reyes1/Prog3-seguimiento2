defmodule Main do
  def main() do
    nombre=Util.input("Ingrese el nombre del empleado: ", :string)
    temperatura=Util.input("ingrese la temperatura en grados Celsius: ", :float)
    temperatura_fahrenheit=calcular_fahrenheit(temperatura)
    temperatura_kelvin=calcular_kelvin(temperatura)
    Util.show_message
  end
end
