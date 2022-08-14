defmodule Query.Securities do
  @moduledoc """
  iss doc: https://iss.moex.com/iss/reference/5
  """

  alias Query.Schema
  alias Query.Params

  @doc """
  Агрегированные итоги торгов за дату по рынкам
  https://iss.moex.com/iss/reference/214
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

  @spec indices(Security.t(), [{:lang, Params.lang()} | {:only_actual, Params.only_actual()}]) ::
          Schema.t()

  def indices(security, params \\ %{}) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/securities/" <> security.seqid <> "/indices"
    }
    |> Schema.release()
  end

  @doc """
  Список бумаг торгуемых на московской бирже.
  https://iss.moex.com/iss/reference/5
  """

  @spec list([
          {:q, Params.q()}
          | {:lang, Params.lang()}
          | {:start, Params.start()}
          | {:limit, Params.limit()}
          | {:market, Params.market()}
          | {:engine, Params.engine()}
          | {:group_by, Params.group_by()}
          | {:is_trading, Params.is_trading()}
          | {:group_by_filter, Params.group_by_filter()}
        ]) :: Schema.t()

  def list(params \\ []) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/securities"
    }
    |> Schema.release()
  end
end
