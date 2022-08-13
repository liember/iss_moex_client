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
    field :params, map(), default: %{}
    field :path, String.t(), enforce: true
    field :payload, map(), default: %{}
  end

  @spec add_params_to_path(t()) :: t()

  def add_params_to_path(request) do
    params =
      request.params
      |> Enum.filter(fn
        {_, nil} -> false
        _ -> true
      end)
      |> Enum.map(fn {key, value} -> to_string(key) <> "=" <> to_string(value) end)
      |> Enum.join("&")

    %{request | path: request.path <> "?" <> params}
  end
end
