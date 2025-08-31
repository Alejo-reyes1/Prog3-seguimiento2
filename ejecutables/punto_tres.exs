Code.require_file("util/util.ex")

defmodule Main do

  def main() do
    nombre=Util.input("Ingrese el nombre del empleado: ", :string)
    temperatura=Util.input("ingrese la temperatura en grados Celsius: ", :float)
    temperatura_fahrenheit=calcular_fahrenheit(temperatura)
    temperatura_kelvin=calcular_kelvin(temperatura)
    Util.show_message("#{nombre}, la temperatura en Fahrenheit es #{temperatura_fahrenheit} °F y en Kelvin es #{temperatura_kelvin} K")
  end

  def calcular_fahrenheit(temperatura) do
    calcular_temperatura=Float.round((temperatura*9/5)+32,1)
    calcular_temperatura
  end

  def calcular_kelvin(temperatura) do
    calular_temperatura=Float.round(temperatura+273.15,1)
    calular_temperatura
  end
end

Main.main()
