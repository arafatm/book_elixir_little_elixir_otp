defmodule Metex.WorkerTest do
  use ExUnit.Case, async: true                                                                                                                           

  test "temperature in Verkhoyansk, Russia" do                                                                                                      
    temp = Metex.Worker.temperature_of("Verkhoyansk, Russia")
    assert String.starts_with?(temp, "Verkhoyansk, Russia: ")
  end

  test "temperature in unknown location" do
    temp = Metex.Worker.temperature_of("Omicron Persei 8")
    assert String.starts_with?(temp, "Omicron Persei 8 not found")
  end
end                                                                                                                                                      
