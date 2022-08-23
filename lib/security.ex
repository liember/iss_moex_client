defmodule Security do
  @moduledoc """
  TODO задокументировать это
  """

  use TypedStruct

  typedstruct do
    @typedoc "Security"

    field :seqid, String.t()
    field :title, String.t()
    field :market, String.t()
    field :engine, String.t()
    field :decimals, String.t()
    field :history_from, String.t()
    field :history_till, String.t()
    field :listed_from, String.t()
    field :listed_till, String.t()
    field :is_primary, String.t()
    field :currencyid, integer()
    field :board_group_id, integer()
    field :market_id, integer()
    field :boardid, integer()
    field :engine_id, integer()

    field :id, integer()
    field :secid, String.t()
    field :shortname, String.t()
    field :regnumber, String.t()
    field :name, String.t()
    field :isin, String.t()
    field :is_traded, integer()
    field :emitent_id, integer()
    field :emitent_title, String.t()
    field :emitent_inn, String.t()
    field :emitent_okpo, String.t()
    field :gosreg, String.t()
    field :type, String.t()
    field :group, String.t()
    field :primary_boardid, String.t()
    field :marketprice_boardid, String.t()
  end
end
