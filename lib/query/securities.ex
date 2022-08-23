defmodule Query.Securities do
  @moduledoc """
  iss doc: https://iss.moex.com/iss/reference/5
  """

  alias Query.Schema
  alias Query.Params, as: Pars

  @doc """
  Агрегированные итоги торгов за дату по рынкам
  https://iss.moex.com/iss/reference/214
  """

  @spec aggregates(Security.t(), [Pars.lang() | Pars.date()]) :: Schema.t()

  def aggregates(security, params \\ []) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/securities/" <> security.secid <> "/aggregates"
    }
  end

  @doc """
  Получить спецификацию инструмента. Например: https://iss.moex.com/iss/securities/IMOEX.xml
  https://iss.moex.com/iss/reference/13
  """

  @spec get(Security.t(), [Pars.lang() | Pars.start()]) :: Schema.t()

  def get(security, params \\ []) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/securities/" <> security.secid
    }
  end

  @doc """
  Список индексов в которые входит бумага
  https://iss.moex.com/iss/reference/160
  """

  @spec indices(Security.t(), [Pars.lang() | Pars.only_actual()]) :: Schema.t()

  def indices(security, params \\ []) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/securities/" <> security.seqid <> "/indices"
    }
  end

  @doc """
  Список бумаг торгуемых на московской бирже.
  https://iss.moex.com/iss/reference/5
  """

  @spec list([
          Pars.q()
          | Pars.lang()
          | Pars.start()
          | Pars.limit()
          | Pars.market()
          | Pars.engine()
          | Pars.group_by()
          | Pars.is_trading()
          | Pars.group_by_filter()
        ]) :: Schema.t()

  def list(params \\ []) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/securities"
    }
  end
end
