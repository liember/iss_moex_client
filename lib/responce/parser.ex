defmodule Responce.Parser do
  alias Responce.Engine
  alias Responce.Security
  alias Responce.Description

  defp parse_by_cols([], [], res), do: res
  ## TODO throw err
  defp parse_by_cols([], _, _), do: {:error, :size}

  defp parse_by_cols([col | cols], [f | data], res),
    do: parse_by_cols(cols, data, %{res | col => f})

  @spec parse(struct(), %{required(String.t()) => list(), required(String.t()) => list()}) ::
          struct()

  defp parse(init, %{"columns" => cols, "data" => data}) do
    cols = for col <- cols, do: String.to_atom(col)
    Enum.map(data, fn d -> parse_by_cols(cols, d, init) end)
  end

  ###########################################################
  ## Public
  ###########################################################

  def parse(%{"securities" => securities}), do: parse(%{}, securities)

  def parse(%{"boards" => securities, "description" => descr}) do
    {ResponceParser.parse(%Security{}, securities), parse(descr)}
  end

  def parse(%{"engines" => engines}), do: Parser.parse(%Engine{}, engines)

  def parse(%{"description" => descr}), do: Parser.parse(%Description{}, descr)

  def parse(other), do: {:error, other}
end
