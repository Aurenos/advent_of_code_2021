defmodule Util do
  def load_input(file_path, line_transform) do
    File.stream!(file_path, [:read])
    |> Stream.map(&(line_transform.(&1)))
    |> Enum.to_list
  end
end
