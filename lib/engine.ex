defmodule Engine do
  @moduledoc """
  TODO задокументировать это
  """

  use TypedStruct

  typedstruct do
    @typedoc "Security"

    field :id, integer()
    field :title, String.t()
    field :name, String.t()
  end
end
