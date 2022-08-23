defmodule Query.Params do
  @typedoc """
  q Поиск инструмента по части Кода, Названию, ISIN, Идентификатору Эмитента, Номеру гос.регистрации.
    Например: https://iss.moex.com/iss/securities.xml?q=MOEX

    Слова длиной менее трёх букв игнорируются. Если параметром передано два слова через пробел. То каждое должно быть длиной не менее трёх букв.
    Default:
    Type: var
  """
  @type q :: {:q, String.t()}

  @spec query(String.t()) :: q()
  def query(q), do: {:q, q}

  @typedoc """
  Язык результата: ru или en
  Default: ru
  Type: var
  """
  @type lang :: {:lang, :ru | :en}

  @spec lang_rus :: lang()
  def lang_rus, do: {:lang, :ru}

  @spec lang_eng :: lang()
  def lang_eng, do: {:lang, :en}

  @typedoc """
  Default:
  Type: atom
  Values:
    stock - Фондовый рынок и рынок депозитов
    currency - Валютный рынок
    futures - Срочный рынок
  """
  @type engine :: {:engine, :stock | :currency | :futures}

  # TODO add %Engine{} as possible param

  @spec engine_stock :: engine()
  def engine_stock, do: {:engine, :stock}

  @spec engine_currency :: engine()
  def engine_currency, do: {:engine, :currency}

  @spec engine_futures :: engine()
  def engine_futures, do: {:engine, :futures}

  @typedoc """
  Default:
  Type: var
  """
  @type is_trading :: {:is_trading, boolean()}

  @spec is_trading(boolean()) :: is_trading()
  def is_trading(p), do: {:is_trading, p}

  @typedoc """
  Default:
  Type: var
  """
  @type market :: {:market, String.t()}

  # TODO add %Market{} as possible param

  @spec market(String.t()) :: market()
  def market(s), do: {:market, s}

  @typedoc """
  Default:
  Type: var
  """
  @type group_by :: {:group_by, String.t()}

  @spec group_by(String.t()) :: group_by()
  def group_by(p), do: {:group_by, p}

  @typedoc """
  Количество выводимых инструментов (5, 10, 20,100)
  Default: 100
  Type: var
  """
  @type limit :: Integer.t()

  @spec limit(Integer.t()) :: limit()
  def limit(l), do: {:limit, l}

  @typedoc """
  Фильтровать по типам group или type.
  Зависит от значения фильтра group_by
  Default:
  Type: var
  """
  @type group_by_filter :: {:group_by_filter, String.t()}

  @spec group_by_filter(String.t()) :: group_by_filter()
  def group_by_filter(f), do: {:group_by_filter, f}

  @typedoc """
  Номер строки (отсчет с нуля), с которой следует начать порцию возвращаемых данных (см. рук-во разработчика).
  Получение ответа без данных означает, что указанное значение превышает число строк, возвращаемых запросом.
  Default: 0
  Type: number
  """
  @type start :: Integer.t()

  @spec start(Integer.t()) :: {:start, Integer.t()}
  def start(s), do: {:start, s}

  @typedoc """
  дата за которую необходимо отобразить данные.
  По умолчанию за последнюю дату в итогах торгов.
  Default: last
  Type: string
  """

  @type date :: String.t()

  # TODO add Elixir date as possible param

  @spec date(String.t()) :: {:date, String.t()}
  def date(d), do: {:date, d}

  @typedoc """
  Выводить индексы в базе которого бумага находится прямо сейчас.
  Default: 0
  Type: var
  """

  # TODO wtf var??? maybe boolean() or integer()

  @type only_actual :: any()

  @spec only_actual(any) :: {:only_actual, any}
  def only_actual(a), do: {:only_actual, a}
end
