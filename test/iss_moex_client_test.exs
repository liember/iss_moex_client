defmodule IssMoexClientTest do
  use ExUnit.Case
  doctest IssMoexClient

  test "greets the world" do
    assert IssMoexClient.hello() == :world
  end
end
