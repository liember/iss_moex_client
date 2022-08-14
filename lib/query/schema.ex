defmodule Query.Schema do
  use TypedStruct

  @moduledoc """
  TODO описание
  """

  alias Responce.Parser

  @typedoc """
  HTTP методы в виде атомов
  """
  @type method :: :get

  typedstruct do
    @typedoc "Security"
    field :method, method(), enforce: true
    field :path, String.t(), enforce: true
    field :params, [keyword()], default: []
    field :payload, map(), default: %{}
  end

  @doc """
  Подготавливает к использованию tesla
  """

  @spec release(t()) :: t()

  def release(request) do
    %{request | path: String.downcase(request.path) <> ".json"}
    |> IssMoexClient.Client.send_request()
    |> case do
      {:ok, resp} -> Parser.parse(resp.body)
      err -> err
    end
  end
end
