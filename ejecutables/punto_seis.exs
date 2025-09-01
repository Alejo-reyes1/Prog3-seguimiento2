Code.require_file("util/util.ex")

defmodule Main do
  
  def main() do
    cliente = Util.input("Ingrese el nombre del cliente:", :string)
    peso = Util.input("Ingrese el peso del paquete en kg:", :float)
    tipo_envio = solicitar_tipo_envio()
    
    resultado = calcular_costo_envio(cliente, peso, tipo_envio)
    mostrar_resultado(resultado)
  end
  
  def solicitar_tipo_envio() do
    tipo = Util.input("Ingrese el tipo de envío (Económico, Express, Internacional):", :string)
    tipo_normalizado = String.downcase(String.trim(tipo))
    
    # Usar cond para validar el tipo de envío
    cond do
      tipo_normalizado in ["economico", "económico"] -> "Económico"
      tipo_normalizado == "express" -> "Express"
      tipo_normalizado == "internacional" -> "Internacional"
      true -> 
        Util.show_message("Tipo de envío inválido. Use: Económico, Express o Internacional")
        solicitar_tipo_envio()
    end
  end
  
  def calcular_costo_envio(cliente, peso, tipo_envio) do
    # Usar case con pattern matching para calcular la tarifa
    tarifa_por_kg = case tipo_envio do
      "Económico" -> 5000
      "Express" -> 8000
      "Internacional" -> calcular_tarifa_internacional(peso)
    end
    
    costo_total = peso * tarifa_por_kg
    costo_redondeado = Float.round(costo_total, 2)
    
    # Retornar tupla como se solicita
    {cliente, peso, tipo_envio, costo_redondeado}
  end
  
  defp calcular_tarifa_internacional(peso) do
    # Usar if para determinar la tarifa internacional según el peso
    if peso <= 5.0 do
      15000
    else
      12000
    end
  end
  
  defp mostrar_resultado({cliente, peso, tipo_envio, costo_total}) do
    costo_formateado = formatear_precio(costo_total)
    
    mensaje = "Cliente: #{cliente}\nPeso: #{peso} kg\nTipo de envío: #{tipo_envio}\nCosto total: $#{costo_formateado}"
    
    Util.show_message(mensaje)
  end
  
  defp formatear_precio(precio) do
    # Convertir a entero si es un número entero
    precio_redondeado = if precio == Float.floor(precio) do
      trunc(precio)
    else
      precio
    end
    
    # Convertir a string y formatear con separadores de miles
    precio_str = to_string(precio_redondeado)
    
    # Agregar separadores de miles
    agregar_separadores_miles(precio_str)
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