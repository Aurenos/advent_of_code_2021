defmodule DayOne do
  def part1(num_list) do
    {_, total} = Enum.reduce(num_list, {-1, -1},
      fn x, {last, total} ->
        if x > last do
          {x, total + 1}
        else
          {x, total}
        end
      end)

    total
  end

  def part2(num_list) do
    chunks =
      num_list
      |> Enum.chunk_every(3, 1, :discard)
      |> Enum.map(&Enum.sum/1)

    part1(chunks)
  end

  def solve(input_path, part) do
    input_data = load_input(input_path)
    case part do
      :part1 -> part1(input_data)
      :part2 -> part2(input_data)
      _ -> nil
    end
  end

  defp load_input(path) do
    Util.load_input(
      path,
      &(&1 |> String.trim_trailing |> String.to_integer)
    )
  end
end
