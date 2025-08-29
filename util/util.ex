defmodule Util do

  def show_message(message) do
    message
    |> IO.puts()
end

def input(message, :string) do
System.cmd("java", ["-cp", ".", "Mensaje","input", message])
|> elem(0)
|> String.trim()

end

def input(message, :integer) do
    try do
      message
      |> input(:string)
      |> String.to_integer()
    rescue
      ArgumentError ->
        show_message("Error: Input is not a valid integer.")
      message
      |> input(:integer)
    end
  end

def input(message, :float) do
  try do
    message
    |>input(:string)
    |>String.to_float()
  rescue
    ArgumentError ->
      show_message("Error: Input is not a valid float.")

    message
    |> input(:float)
  end
end

end
