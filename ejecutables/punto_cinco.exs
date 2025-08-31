Code.require_file("util/util.ex")

defmodule Main do
  def main() do
    placa=Util.input("Ingrese la placa del vehiculo: ", :string)
    tipo=String.downcase(Util.input("Ingrse el tipo de vehiculo (carro, moto, camion)", :string ))
    peso=Util.input("Ingrese el peso del vehículo (toneladas): ", :float)
    informacion_peaje=calcular_peaje(placa,tipo,peso)
    Util.show_message("Vehiculo con placa #{elem(informacion_peaje,0)} de tipo #{elem(informacion_peaje,1)} debe pagar #{elem(informacion_peaje,2)}")
  end

  def calcular_peaje(placa,tipo,peso) do
    peaje=
      case tipo do
      "carro" -> peaje=10000
      "moto" -> peaje=5000
      "camion" -> peaje=20000+(peso*2000)
    end
    informacion_vehiculo={placa,tipo,peaje}
    informacion_vehiculo
  end
end

Main.main()
