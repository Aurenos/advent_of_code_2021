defmodule DayThree do
  def part1(input_data) do
    line_length = String.length(hd(input_data))
    indexes = 0..(line_length - 1)

    data_map =
      for idx <- indexes,
          into: %{},
          do: {idx, %{zero: 0, one: 0}}

    data_map = Enum.reduce(input_data, data_map, fn str, data_map ->
      Enum.reduce(
        Enum.zip(indexes, String.graphemes(str)),
        data_map,
        fn {idx, char}, dmap ->
          %{zero: z, one: o} = Map.fetch!(dmap, idx)

          map_entry =
            case char do
              "0" -> %{zero: z + 1, one: o}
              "1" -> %{zero: z, one: o + 1}
            end

          Map.put(dmap, idx, map_entry)
        end
      )
    end)

    {gamma, epsilon} =
      Enum.reduce(
        Map.values(data_map),
        {"", ""},
        fn %{zero: zeros, one: ones}, {g, e} ->
          if zeros > ones do
            {g <> "0", e <> "1"}
          else
            {g <> "1", e <> "0"}
          end
        end
      )

    :erlang.binary_to_integer(gamma, 2) * :erlang.binary_to_integer(epsilon, 2)
  end

  def part2(input_data) do
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
