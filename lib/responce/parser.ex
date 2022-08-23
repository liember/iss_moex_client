defmodule Responce.Parser do
  defp parse_by_cols([], [], res), do: res
  ## TODO throw err
  defp parse_by_cols([], _, _), do: {:error, :size}

  defp parse_by_cols([col | cols], [f | data], res),
    do: parse_by_cols(cols, data, %{res | col => f})

  @spec parse(struct(), %{required(String.t()) => list(), required(String.t()) => list()}) :: [
          struct()
        ]

  defp parse(init, %{"columns" => cols, "data" => data}) do
    cols = for col <- cols, do: String.to_existing_atom(col)
    Enum.map(data, fn d -> parse_by_cols(cols, d, init) end)
  end

  ###########################################################
  ## Public
  ###########################################################

  def parse(%{"securities" => securities}), do: parse(%Security{}, securities)

  def parse(%{"boards" => securities, "description" => descr}) do
    {parse(%Security{}, securities), parse(descr)}
  end

  def parse(%{"engines" => engines}), do: parse(%Engine{}, engines)

  def parse(%{"description" => descr}), do: parse(%Description{}, descr)

  def parse(other), do: {:error, other}
end
