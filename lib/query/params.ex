defmodule Query.Params do
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
end
