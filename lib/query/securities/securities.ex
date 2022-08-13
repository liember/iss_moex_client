defmodule IssMoexClient.Securities do
  @moduledoc """
  iss doc: https://iss.moex.com/iss/reference/5
  """

  alias IssMoexClient.Query.Schema
  alias IssMoexClient.Securities.Security

  @typedoc """
  q Поиск инструмента по части Кода, Названию, ISIN, Идентификатору Эмитента, Номеру гос.регистрации.
    Например: https://iss.moex.com/iss/securities.xml?q=MOEX

    Слова длиной менее трёх букв игнорируются. Если параметром передано два слова через пробел. То каждое должно быть длиной не менее трёх букв.
    Default:
    Type: var
  """
  @type q :: String.t()

  @typedoc """
  Язык результата: ru или en
  Default: ru
  Type: var
  """
  @type lang :: :ru | :en

  @typedoc """
  Default:
  Type: atom
  Values:
    stock - Фондовый рынок и рынок депозитов
    currency - Валютный рынок
    futures - Срочный рынок
  """
  @type engine :: :stock | :currency | :futures

  @typedoc """
  Default:
  Type: var
  """
  @type is_trading :: boolean()

  @typedoc """
  Default:
  Type: var
  """
  @type market :: String.t()

  @typedoc """
  Default:
  Type: var
  """
  @type group_by :: String.t()

  @typedoc """
  Количество выводимых инструментов (5, 10, 20,100)
  Default: 100
  Type: var
  """
  @type limit :: Integer.t()

  @typedoc """
  Фильтровать по типам group или type.
  Зависит от значения фильтра group_by
  Default:
  Type: var
  """
  @type group_by_filter :: String.t()

  @typedoc """
  Номер строки (отсчет с нуля), с которой следует начать порцию возвращаемых данных (см. рук-во разработчика).
  Получение ответа без данных означает, что указанное значение превышает число строк, возвращаемых запросом.
  Default: 0
  Type: number
  """
  @type start :: Integer.t()

  @typedoc """
  дата за которую необходимо отобразить данные.
  По умолчанию за последнюю дату в итогах торгов.
  Default: last
  Type: string
  """

  @type date :: String.t()

  @typedoc """
  Выводить индексы в базе которого бумага находится прямо сейчас.
  Default: 0
  Type: var
  """

  @type only_actual :: any()

  @doc """
  Агрегированные итоги торгов за дату по рынкам
  https://iss.moex.com/iss/reference/214
  """

  @spec aggregates(Security.t(), %{
          optional(:lang) => lang(),
          optional(:date) => date()
        }) :: Security.t()

  def aggregates(security, params) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/securities/" <> String.downcase(security.secid) <> "/aggregates"
    }
  end

  @doc """
  Получить спецификацию инструмента. Например: https://iss.moex.com/iss/securities/IMOEX.xml
  https://iss.moex.com/iss/reference/13
  """

  @spec get(Security.t(), %{
          optional(:lang) => lang(),
          optional(:start) => start()
        }) :: Security.t()

  def get(security, params) do
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

  @spec indices(Security.t(), %{
          optional(:lang) => lang(),
          optional(:only_actual) => only_actual()
        }) :: Schema.t()

  def indices(security, params) do
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

  @spec list(%{
          optional(:q) => q(),
          optional(:lang) => lang(),
          optional(:start) => start(),
          optional(:limit) => limit(),
          optional(:market) => market(),
          optional(:engine) => engine(),
          optional(:group_by) => group_by(),
          optional(:is_trading) => is_trading(),
          optional(:group_by_filter) => group_by_filter()
        }) :: Schema.t()

  def list(params) do
    %Schema{
      method: :get,
      params: params,
      path: "/iss/securities"
    }
  end
end
