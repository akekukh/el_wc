defmodule ElWcTest do
  use ExUnit.Case

  import Mock
  import PathHelpers

  test "if file does not exist" do
    with_mocks([
      {File, [:passthrough], [exists?: fn _ -> false end]},
      {IO, [:passthrough], [gets: fn _ -> fixture_path("foo") end]}
    ]) do
      assert ElWc.run() == :file_not_found
    end
  end

  test "if file exist" do
    with_mock(IO, [:passthrough], gets: fn _ -> fixture_path("3_words.txt") end) do
      assert ElWc.run() == 3
    end
  end
end
