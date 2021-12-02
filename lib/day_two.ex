defmodule DayTwo do
  def part1(input_data) do
    {distance, depth} = Enum.reduce(input_data, {0, 0}, &move/2)
    distance * depth
  end

  def part2(input_data) do
    {distance, depth, _} = Enum.reduce(input_data, {0, 0, 0}, &move/2)
    distance * depth
  end

  # Moves for Part 1
  defp move("forward " <> delta, {distance, depth}) do
    {distance + String.to_integer(delta), depth}
  end

  defp move("up " <> delta, {distance, depth}) do
    {distance, depth - String.to_integer(delta)}
  end

  defp move("down " <> delta, {distance, depth}) do
    {distance, depth + String.to_integer(delta)}
  end

  # Moves for Part 2
  defp move("forward " <> delta, {distance, depth, aim}) do
    delta = String.to_integer(delta)
    {distance + delta, depth + (aim * delta), aim}
  end

  defp move("up " <> delta, {distance, depth, aim}) do
    delta = String.to_integer(delta)
    {distance, depth, aim - delta}
  end

  defp move("down " <> delta, {distance, depth, aim}) do
    delta = String.to_integer(delta)
    {distance, depth, aim + delta}
  end

  def solve(input_file, part) do
    input_data = load_input(input_file)
    case part do
      :part1 -> part1(input_data)
      :part2 -> part2(input_data)
      _ -> nil
    end
  end

  def load_input(path) do
    Util.load_input(
      path,
      &String.trim_trailing/1
    )
  end

end
