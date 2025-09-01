Code.require_file("util/util.ex")

# ======================================================================
# OBSERVACIÓN IMPORTANTE:
# En las instrucciones del ejercicio hay un error en el ejemplo.
# Con los datos: Salario base $1,500,000 y 5 horas extras,
# el ejemplo indica que el resultado debería ser $1,218,750,
# pero esto es matemáticamente incorrecto.
#
# CÁLCULO CORRECTO:
# - Valor hora normal: $1,500,000 ÷ 240 horas = $6,250
# - Valor hora extra: $6,250 × 1.5 = $9,375  
# - Total horas extras: 5 × $9,375 = $46,875
# - Salario total correcto: $1,500,000 + $46,875 = $1,546,875
# ======================================================================

defmodule Main do
  
  def main() do
    nombre = Util.input("Ingrese el nombre del empleado:", :string)
    salario_base = Util.input("Ingrese el salario base:", :float)
    horas_extras = Util.input("Ingrese las horas extras trabajadas:", :integer)
    
    salario_total = calcular_salario_total(salario_base, horas_extras)
    salario_formateado = formatear_salario(salario_total)
    
    Util.show_message("El salario total de #{nombre} es de $#{salario_formateado}.")
  end
  
  def calcular_salario_total(salario_base, horas_extras) do
    # Calcular el valor de una hora normal (asumiendo 30 días * 8 horas = 240 horas mensuales)
    valor_hora_normal = salario_base / 240
    
    # Calcular el valor de las horas extras (1.5x el valor normal)
    valor_horas_extras = horas_extras * valor_hora_normal * 1.5
    
    # Calcular el salario total
    salario_total = salario_base + valor_horas_extras
    Float.round(salario_total, 2)
  end
  
  defp formatear_salario(salario) do
    # Convertir a entero si es un número entero
    salario_redondeado = if salario == Float.floor(salario) do
      trunc(salario)
    else
      salario
    end
    
    # Convertir a string y formatear con separadores de miles
    salario_str = to_string(salario_redondeado)
    
    # Agregar separadores de miles
    agregar_separadores_miles(salario_str)
  end
  
  defp agregar_separadores_miles(numero_str) do
    # Dividir en parte entera y decimal (si existe)
    partes = String.split(numero_str, ".")
    parte_entera = Enum.at(partes, 0)
    parte_decimal = Enum.at(partes, 1)
    
    # Formatear parte entera con separadores de miles
    parte_entera_formateada = parte_entera
    |> String.reverse()
    |> String.graphemes()
    |> Enum.chunk_every(3)
    |> Enum.map(&Enum.join/1)
    |> Enum.join(",")
    |> String.reverse()
    
    # Reconstruir el número
    if parte_decimal do
      "#{parte_entera_formateada}.#{parte_decimal}"
    else
      parte_entera_formateada
    end
  end
  
end

Main.main() 