defmodule RaytracerTest do
  use ExUnit.Case
  doctest Raytracer

  test "greets the world" do
    assert Raytracer.hello() == :world
  end
end
