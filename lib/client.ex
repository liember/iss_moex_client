defmodule Client do
  use Tesla

  alias Query.Schema

  plug(Tesla.Middleware.BaseUrl, "http://iss.moex.com")
  plug(Tesla.Middleware.JSON)
  plug(Tesla.Middleware.Logger)

  @spec send_request(Schema.t()) :: {:error, any} | {:ok, Tesla.Env.t()}

  def send_request(query) do
    query
    |> Schema.release()
    |> case do
      %Schema{method: :get} = r ->
        get(r.path, query: r.params)

      _ ->
        {:error, :undefinde_method}
    end
  end
end
