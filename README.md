# Taller 2 - Seguimiento 2 - Programación 3

Este proyecto contiene varios ejercicios desarrollados en Elixir con integración a Java para interfaz gráfica.

## Estructura del Proyecto

### Carpeta `util/`
- **`util.ex`**: Módulo con funciones de utilidad para entrada/salida
- **`Mensaje.java`**: Clase Java para ventanas de diálogo usando Swing
- **`Elixir.Util.beam`**: Archivo compilado del módulo Util
- **`Mensaje.class`**: Clase Java compilada

### Ejercicios Implementados

#### Punto 1 (`punto_uno.exs`) - Calculadora de Rendimiento de Combustible
**Descripción:** Calcula el rendimiento de combustible de un vehículo.
- **Entrada:** Nombre del conductor, kilómetros recorridos, litros consumidos
- **Proceso:** Calcula km/l con redondeo a 2 decimales
- **Salida:** Muestra el rendimiento personalizado por nombre

#### Punto 2 (`punto_dos.exs`) - Sistema de Inventario de Librería
**Descripción:** Gestiona el inventario de libros calculando el valor total.
- **Entrada:** Título del libro, cantidad de unidades, precio unitario
- **Proceso:** Calcula valor total con validación de datos y manejo de errores
- **Características:** Formateo de números con separadores de miles, conversión inteligente de tipos
- **Salida:** Información completa del inventario con formato profesional

#### Punto 3 (`punto_tres.exs`) - Conversor de Temperaturas
**Descripción:** Convierte temperaturas de Celsius a otras unidades.
- **Entrada:** Nombre del empleado, temperatura en Celsius
- **Proceso:** Convierte a Fahrenheit (°C × 9/5 + 32) y Kelvin (°C + 273.15)
- **Salida:** Temperaturas en las tres escalas con redondeo a 1 decimal

#### Punto 4 (`punto_cuatro.exs`) - Calculadora de Salario con Horas Extras
**Descripción:** Calcula el salario total incluyendo horas extras.
- **Entrada:** Nombre del empleado, salario base, horas extras trabajadas
- **Proceso:** Calcula horas extras al 1.5x del valor hora normal (base/240 horas)
- **Salida:** Salario total con formato de separadores de miles

**⚠️ OBSERVACIÓN IMPORTANTE - PUNTO 4:**
En las instrucciones del ejercicio hay un error en el ejemplo. Con los datos:
- Nombre: María Gómez
- Salario base: $1,500,000
- Horas extras: 5

El ejemplo indica que el resultado debería ser $1,218,750, pero esto es matemáticamente incorrecto. 

**Cálculo correcto:**
- Valor hora normal: $1,500,000 ÷ 240 horas = $6,250
- Valor hora extra: $6,250 × 1.5 = $9,375
- Total horas extras: 5 × $9,375 = $46,875
- **Salario total correcto: $1,500,000 + $46,875 = $1,546,875**

#### Punto 5 (`punto_cinco.exs`) - Calculadora de Peajes
**Descripción:** Calcula el costo de peaje según el tipo de vehículo.
- **Entrada:** Placa del vehículo, tipo (carro/moto/camión), peso (para camiones)
- **Tarifas:** 
  - Carro: $10,000
  - Moto: $5,000  
  - Camión: $20,000 + (peso × $2,000)
- **Salida:** Información completa del vehículo y tarifa a pagar

#### Punto 6 (`punto_seis.exs`) - Cálculo de Costo de Envío de Paquetes
**Descripción:** Calcula el costo de envío según peso y tipo de servicio.
- **Entrada:** Nombre del cliente, peso del paquete (kg), tipo de envío
- **Tarifas por kg:**
  - Económico: $5,000
  - Express: $8,000
  - Internacional: $15,000 (≤5kg) / $12,000 (>5kg)
- **Características técnicas:**
  - Uso de `if` para evaluación de peso internacional
  - Uso de `cond` para validación de tipos de envío
  - Uso de `case` con pattern matching para cálculo de tarifas
  - Retorna tupla: `{cliente, peso, tipo_envio, costo_total}`
- **Salida:** Información completa del envío con costo formateado

## Características Técnicas

- **Integración Elixir-Java**: Uso de `System.cmd()` para ejecutar clase Java
- **Interfaz gráfica**: Ventanas de diálogo usando JOptionPane de Swing
- **Validación de entrada**: Manejo de errores y re-solicitud de datos inválidos
- **Formateo de números**: Separadores de miles para mejor legibilidad
- **Arquitectura modular**: Reutilización del módulo `Util` en todos los ejercicios

## Ejecución

Para ejecutar cualquier ejercicio:
```bash
elixir ejecutables/punto_[numero].exs
```

**Nota:** Asegúrese de que la clase Java esté compilada:
```bash
javac -d util util/Mensaje.java
``` 