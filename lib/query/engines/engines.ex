defmodule Query.Engines do
  @moduledoc """
  TODO doc
  """

  alias Query.Schema
  alias Query.Params

  @doc """
  Получить описание и режим работы торговой системы.
  Например: https://iss.moex.com/iss/engines/stock.xml

  Api doc reference: https://iss.moex.com/iss/reference/41
  """

  @spec get(String.t() | Engine.t(), [{:lang, Params.lang()}]) :: Schema.t()

  def get(engine, params \\ []) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/engines" <> engine
    }
  end

  @doc """
  /iss/engines

  Получить доступные торговые системы.
  Например: https://iss.moex.com/iss/engines.xml
  Api doc reference: https://iss.moex.com/iss/reference/40
  """

  @spec list([{:lang, Params.lang()}]) :: Schema.t()

  def list(params \\ []) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/engines"
    }
  end
end
