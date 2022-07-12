defmodule IssMoexClient.Securities do
  # https://iss.moex.com/iss/reference/5

  def all(lang \\ "ru") do
    "/iss/securities"
  end
end
