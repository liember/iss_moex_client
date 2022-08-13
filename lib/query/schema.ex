defmodule IssMoexClient.Query.Schema do
  use TypedStruct

  @moduledoc """
  TODO описание
  """

  @typedoc """
  HTTP методы в виде атомов
  """
  @type method :: :get

  typedstruct do
    @typedoc "Security"
    field :method, method(), enforce: true
    field :params, [keyword()], default: []
    field :path, String.t(), enforce: true
    field :payload, map(), default: %{}
  end
end
