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
input(message, :string)
|> String.to_integer()
end

def input(message, :float) do
input(message, :string)
|> String.to_float()
end

end
