Code.require_file("util/util.ex")

defmodule Main do

  def main() do
    nombre=Util.input("Ingrese su nombre: ", :string)
    kilometros=Util.input("Ingrese los kilometros recorridos: ", :float)
    litros=Util.input("Ingresar la cantidad de combustible consumido en litros ", :float)
    rendimiento=calcular_rendimiento(kilometros,litros)
    Util.show_message("#{nombre}, su rendimiento es de #{rendimiento} km/l")
  end

  def calcular_rendimiento(kilometros,litros) do
    calculo_rendimiento=Float.round(kilometros/litros,2)
    calculo_rendimiento
  end
end

Main.main()
