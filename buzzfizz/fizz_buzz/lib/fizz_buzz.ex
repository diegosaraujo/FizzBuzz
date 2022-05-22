defmodule FizzBuzz do
  # função utilizando case só para ver como é
  def build(file_name) do
    case File.read(file_name) do
      {:ok, result} -> result
      {:error, result} -> result
    end
  end

  def build2(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}

    # Modo sem utilizar o pipe operator
    # list = String.split(result, ",")
    # Enum.map(list, fn number -> String.to_integer(number) end)
    # Enum.map(list, &String.to_integer/1 ) -- Isso também funciona
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(element) do
    element
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 5) == 0 and rem(number, 3) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
