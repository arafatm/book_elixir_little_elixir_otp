defmodule Metex do
  @moduledoc """
  Documentation for Metex.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Metex.hello
      :world

  """
  def hello do
    :world
  end

  def weatherapi do
    IO.puts Application.get_env(:metex, :weather)
  end
end
