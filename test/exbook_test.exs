defmodule ExBookTest do
  use ExUnit.Case
  doctest ExBook

  test "hello" do
    assert ExBook.hello() == :world
  end

  test "erlang" do
    assert :exbook.init() == :ok
  end
end
