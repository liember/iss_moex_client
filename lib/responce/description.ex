defmodule Responce.Description do
  @moduledoc """
  TODO задокументировать это
  """

  use TypedStruct

  typedstruct do
    @typedoc "Description"

    field :name, String.t()
    field :title, String.t()
    field :value, String.t()
    field :type, String.t()
    field :sort_order, integer()
    field :is_hidden, integer()
    field :precision, integer()
  end
end
