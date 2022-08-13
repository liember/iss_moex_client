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
    field :marketprice_boardid, String.t()
  end

  defp parse_by_cols([], [], res), do: {:ok, res}
  defp parse_by_cols([], _, _), do: {:error, :size}

  defp parse_by_cols([col | cols], [f | data], res),
    do: parse_by_cols(cols, data, %{res | col => f})

  def parse(json_respoce) do
    with cols <- for(col <- json_respoce["securities"]["columns"], do: String.to_atom(col)),
         data <- json_respoce["securities"]["data"] do
      data |> Enum.map(fn d -> parse_by_cols(cols, d, %__MODULE__{}) end)
    else
      _ -> {:error, :parse_error}
    end
  end
end
