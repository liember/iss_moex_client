defmodule IssMoexClient.Securities do
  @moduledoc """
  iss doc: https://iss.moex.com/iss/reference/5
  """

  alias IssMoexClient.Query.Params
  alias IssMoexClient.Securities.Security

  @doc """
  Агрегированные итоги торгов за дату по рынкам
  https://iss.moex.com/iss/reference/214
  """

  @spec aggregates(Security.t(), Params.t()) :: Security.t()

  def aggregates(%Security{}, %Params{}) do
  end

  @doc """
  Получить спецификацию инструмента. Например: https://iss.moex.com/iss/securities/IMOEX.xml
  https://iss.moex.com/iss/reference/13
  """

  @spec get(Security.t(), Params.t()) :: Security.t()

  def get(%Security{}, %Params{}) do
  end

  @doc """
  Список индексов в которые входит бумага
  https://iss.moex.com/iss/reference/160
  """

  @spec indices(Security.t(), Params.t()) :: Security.t()

  def indices(%Security{}, %Params{}) do
  end

  @doc """
  Список бумаг торгуемых на московской бирже.
  https://iss.moex.com/iss/reference/5
  """

  def list(%Params{}) do
  end
end
