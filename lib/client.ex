defmodule IssMoexClient.Client do
  use Tesla

  alias IssMoexClient.Query

  plug(Tesla.Middleware.BaseUrl, "http://iss.moex.com")
  plug(Tesla.Middleware.JSON)
  plug(Tesla.Middleware.Logger)

  @spec send_request(Query.Schema.t()) :: :ok

  def send_request(request) do
    case request.method do
      :get -> get(request.path, query: request.params)
      _ -> {:error, :unsupported}
    end
  end
end
