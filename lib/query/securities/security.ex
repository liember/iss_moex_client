defmodule IssMoexClient.Securities.Security do
  @moduledoc """
  TODO задокументировать это
  """

  use TypedStruct

  typedstruct do
    @typedoc "Security"

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
    field :arketprice_boardid, String.t()
  end
end
