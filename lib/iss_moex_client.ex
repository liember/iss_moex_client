defmodule IssMoexClient do
  use Tesla
  plug(Tesla.Middleware.BaseUrl, "http://iss.moex.com")
  # plug(Tesla.Middleware.Headers, [{"authorization", "token xyz"}])

  plug(Tesla.Middleware.JSON)

  def send_request(request) do
    with {:ok, responce} <- get(request) do
      responce.body
    else
      e -> e
    end
  end

  @moduledoc """
  Documentation for `IssMoexClient`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> IssMoexClient.hello()
      :world

  """
  def hello do
    :world
  end
end
