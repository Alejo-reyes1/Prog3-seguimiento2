# Cargar el módulo de utilidades
Code.require_file("util/util.ex")

defmodule InventarioLibreria do
  
  def main do
    try do
      # Solicitar datos a través de ventanas de diálogo
      titulo = Util.input("Ingrese el título del libro:", :string)
      
      # Verificar que el usuario no canceló
      if titulo == "" do
        System.cmd("java", ["-cp", "util", "Mensaje", "Operación cancelada."])
        System.halt(0)
      end
      
      cantidad_str = Util.input("Ingrese la cantidad de unidades disponibles:", :string)
      if cantidad_str == "" do
        System.cmd("java", ["-cp", "util", "Mensaje", "Operación cancelada."])
        System.halt(0)
      end
      cantidad = String.to_integer(cantidad_str)
      
      precio_str = Util.input("Ingrese el precio unitario:", :string)
      if precio_str == "" do
        System.cmd("java", ["-cp", "util", "Mensaje", "Operación cancelada."])
        System.halt(0)
      end
      precio = convertir_a_float(precio_str)
      
      # Calcular valor total del inventario
      valor_total = cantidad * precio
      
      # Mostrar resultado en ventana de mensaje
      mostrar_resultado_grafico(titulo, cantidad, precio, valor_total)
    catch
      error ->
        System.cmd("java", ["-cp", "util", "Mensaje", "Error: Datos inválidos. #{inspect(error)}"])
    end
  end
  
  defp convertir_a_float(precio_str) do
    # Intentar convertir directamente a float
    case Float.parse(precio_str) do
      {float_val, ""} -> float_val
      {float_val, _} -> float_val
      :error ->
        # Si falla, intentar como entero y convertir a float
        case Integer.parse(precio_str) do
          {int_val, ""} -> int_val * 1.0
          {int_val, _} -> int_val * 1.0
          :error -> raise "Precio inválido: #{precio_str}"
        end
    end
  end
  
  defp mostrar_resultado_grafico(titulo, cantidad, _precio, total) do
    # Formatear el precio con separadores de miles
    total_formateado = formatear_precio(total)
    
    # Crear mensaje con el formato requerido
    mensaje = "El libro \"#{titulo}\" tiene #{cantidad} unidades, con un valor total de $#{total_formateado}."
    
    # Mostrar resultado en ventana de diálogo
    System.cmd("java", ["-cp", "util", "Mensaje", mensaje])
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

# Ejecutar el programa principal
InventarioLibreria.main()
