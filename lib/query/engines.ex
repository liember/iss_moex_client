defmodule Query.Engines do
  @moduledoc """
  iss doc: https://iss.moex.com/iss/reference/5
  """

  alias Query.Schema
  alias Query.Params

  @doc """
  """

  @spec aggregates(Security.t(), [{:lang, Params.lang()} | {:date, Params.date()}]) ::
          Security.t()

  def aggregates(security, params \\ %{}) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/securities/" <> security.secid <> "/aggregates"
    }
    |> Schema.release()
  end

  @doc """
  Получить спецификацию инструмента. Например: https://iss.moex.com/iss/securities/IMOEX.xml
  https://iss.moex.com/iss/reference/13
  """

  @spec get(Security.t(), [{:lang, Params.lang()} | {:start, Params.start()}]) :: Security.t()

  def get(security, params \\ %{}) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/securities/" <> security.secid
    }
    |> Schema.release()
  end

  @doc """
  Список индексов в которые входит бумага
  https://iss.moex.com/iss/reference/160
  """

  def market_secstat(engine, market, params \\ %{}) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/engines/[engine]/markets/[market]/secstats"
    }
    |> Schema.release()
  end

  @doc """
  /iss/engines

  Получить доступные торговые системы.
  Например: https://iss.moex.com/iss/engines.xml
  https://iss.moex.com/iss/reference/40
  """

  @spec list([{:lang, Params.lang()}]) :: Schema.t()

  def list(params \\ []) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/engines"
    }
    |> Schema.release()
  end
end
