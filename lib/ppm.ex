defmodule PPM do

  # write(Name, Image) The image is a list of rows, each row a list of
  # tuples {R,G,B} where the values are integers between 0-255

  def write(name, image) do
    height = length(image)
    width = length(List.first(image))
    {:ok, file} = File.open(name, [:write, :binary])
    IO.puts(file, "P6")
    IO.puts(file, "#generated by ppm.ex")
    IO.puts(file, "#{width} #{height}")
    IO.puts(file, "255")
    rows(image, file)
    File.close(file)
  end

  defp rows(rows, file) do
    Enum.each(rows, fn r -> IO.binwrite(file, row(r)) end)
  end

  defp row(row) do
    result = Enum.reduce(row, [], fn({r, g, b}, a) -> [trunc(r * 255), trunc(g * 255), trunc(b * 255)| a] end)
    Enum.each(result, fn(x)-> cond do
      x > 255 -> IO.inspect(x)
      x < 0 -> IO.inspect(x)
      true -> nil
    end
  end)
    result
  end

end