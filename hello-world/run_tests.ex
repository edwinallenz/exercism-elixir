defmodule RunTests do

  def test do
    Code.load_file("hello_world_test.exs",__DIR__)
    ExUnit.Server.modules_loaded()
    ExUnit.run()
  end
end
