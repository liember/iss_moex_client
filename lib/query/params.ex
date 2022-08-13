defmodule IssMoexClient.Query.Params do
  use TypedStruct

  @moduledoc """
  MarketIndex         = "index"         // Индексы фондового рынка
  MarketShares        = "shares"        // Рынок акций
  MarketBonds         = "bonds"         // Рынок облигаций
  MarketForeignShares = "foreignshares" // Иностранные ценные бумаги
  MarketSelt          = "selt"          // Биржевые сделки с ЦК
  MarketFutures       = "futures"       // Поставочные фьючерсы
  MarketFORTS         = "forts"         // ФОРТС
  MarketOptions       = "options"       // Опционы ФОРТС

  BoardTQBR = "TQBR" // Т+: Акции и ДР — безадресные сделки
  BoardTQTF = "TQTF" // Т+: ETF — безадресные сделки
  BoardFQBR = "FQBR" // Т+ Иностранные Акции и ДР — безадресные сделки

  Полный справочник https://iss.moex.com/iss/index.json
  """

  @typedoc """
  q Поиск инструмента по части Кода, Названию, ISIN, Идентификатору Эмитента, Номеру гос.регистрации.
    Например: https://iss.moex.com/iss/securities.xml?q=MOEX

    Слова длиной менее трёх букв игнорируются. Если параметром передано два слова через пробел. То каждое должно быть длиной не менее трёх букв.
    Default:
    Type: var
  """
  @type q :: {:q, String.t()}

  @typedoc """
  Язык результата: ru или en
  Default: ru
  Type: var
  """
  @type lang :: {:lang, :ru | :en}

  @typedoc """
  Default:
  Type: atom
  Values:
    stock - Фондовый рынок и рынок депозитов
    currency - Валютный рынок
    futures - Срочный рынок
  """
  @type engine :: {:engine, :stock | :currency | :futures}

  @typedoc """
  Default:
  Type: var
  """
  @type is_trading :: {:is_trading, boolean()}

  @typedoc """
  Default:
  Type: var
  """
  @type market :: {:market, String.t()}

  @typedoc """
  Default:
  Type: var
  """
  @type group_by :: {:group_by, String.t()}

  @typedoc """
  Количество выводимых инструментов (5, 10, 20,100)
  Default: 100
  Type: var
  """
  @type limit :: {:limit, Integer.t()}

  @typedoc """
  Фильтровать по типам group или type.
  Зависит от значения фильтра group_by
  Default:
  Type: var
  """
  @type group_by_filter :: {:group_by_filter, String.t()}

  @typedoc """
  Номер строки (отсчет с нуля), с которой следует начать порцию возвращаемых данных (см. рук-во разработчика).
  Получение ответа без данных означает, что указанное значение превышает число строк, возвращаемых запросом.
  Default: 0
  Type: number
  """
  @type start :: {:start, Integer.t()}

  typedstruct do
    @typedoc "Security"

    field :query, q()
    field :language, lang()
    field :engine, engine()
    field :is_trading, is_trading()
    field :market, market()
    field :group_by, group_by()
    field :limit, limit()
    field :group_by_filter, group_by_filter()
    field :start, start()
  end
end
