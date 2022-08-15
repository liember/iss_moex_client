# IssMoexClient

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `iss_moex_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:iss_moex_client, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/iss_moex_client>.

Engines plan:

  | Method | Doc link |
  |-|-|
  | /iss/engines/[engine]/turnovers | https://iss.moex.com/iss/reference/95 |
  | /iss/engines/[engine]/markets/[market]/secstats | https://iss.moex.com/iss/reference/823
  | /iss/engines/[engine]/markets/[market]/turnovers | https://iss.moex.com/iss/reference/96 |
  | /iss/engines/[engine]/markets/zcyc | https://iss.moex.com/iss/reference/89 |
  | /iss/engines/[engine]/zcyc | https://iss.moex.com/iss/reference/634 |
  | /iss/engines | https://iss.moex.com/iss/reference/40 |
  | /iss/engines/[engine] | https://iss.moex.com/iss/reference/41 |
  | /iss/engines/[engine]/markets/[market]/.*?orderbook/columns | https://iss.moex.com/iss/reference/98 |
  | /iss/engines/[engine]/markets/[market]/.*?securities/columns | https://iss.moex.com/iss/reference/99 |
  | /iss/engines/[engine]/markets/[market]/securities/[security]/orderbook | https://iss.moex.com/iss/reference/54 |
  | /iss/engines/[engine]/markets/[market]/trades | https://iss.moex.com/iss/reference/35 |
  | /iss/engines/[engine]/markets/[market]/orderbook | https://iss.moex.com/iss/reference/36 |
  | /iss/engines/[engine]/markets/[market]/boards | https://iss.moex.com/iss/reference/43 |
  | /iss/engines/[engine]/markets/[market]/boards/[board] | https://iss.moex.com/iss/reference/49 |
  | /iss/engines/[engine]/markets/[market]/boards/[board]/securities | https://iss.moex.com/iss/reference/32 |
  | /iss/engines/[engine]/markets/[market]/boards/[board]/securities/[security] | https://iss.moex.com/iss/reference/53 |
  | /iss/engines/[engine]/markets/[market]/boards/[board]/securities/[security]/trades | https://iss.moex.com/iss/reference/56 |
  | /iss/engines/[engine]/markets/[market]/boards/[board]/securities/[security]/orderbook | https://iss.moex.com/iss/reference/ |57 |
  | /iss/engines/[engine]/markets/[market]/securities/[security]/candles | https://iss.moex.com/iss/reference/155 |
  | /iss/engines/[engine]/markets/[market]/securities/[security]/candleborders | https://iss.moex.com/iss/reference/156 |
  | /iss/engines/[engine]/markets/[market]/boardgroups/[boardgroup]/securities/[security]/candleborders | https://iss.moex.com/iss/reference/158 |
  | /iss/engines/[engine]/markets/[market]/boardgroups/[boardgroup]/securities/[security]/candles | https://iss.moex.com/iss/reference/157 |
  | /iss/engines/[engine]/markets/[market]/boards/[board]/securities/[security]/candles | https://iss.moex.com/iss/reference/46 |
  | /iss/engines/[engine]/markets/[market]/boards/[board]/securities/[security]/candleborders | https://iss.moex.com/iss/reference/48 |
  | /iss/engines/[engine]/markets/[market]/boards/[board]/trades | https://iss.moex.com/iss/reference/34 |
  | /iss/engines/[engine]/markets/[market]/boards/[board]/orderbook | https://iss.moex.com/iss/reference/39 |
  | /iss/engines/[engine]/markets/[market]/boardgroups | https://iss.moex.com/iss/reference/45 |
  | /iss/engines/[engine]/markets/[market]/boardgroups/[boardgroup] | https://iss.moex.com/iss/reference/50 |
  | /iss/engines/[engine]/markets/[market]/boardgroups/[boardgroup]/securities | https://iss.moex.com/iss/reference/29 |
  | /iss/engines/[engine]/markets/[market]/boardgroups/[boardgroup]/securities/[security] | https://iss.moex.com/iss/reference/58 |
  | /iss/engines/[engine]/markets/[market]/boardgroups/[boardgroup]/securities/[security]/trades | https://iss.moex.com/iss/reference/60 |
  | /iss/engines/[engine]/markets/[market]/boardgroups/[boardgroup]/securities/[security]/orderbook | https://iss.moex.com/iss/reference/59 |
  | /iss/engines/[engine]/markets/[market]/boardgroups/[boardgroup]/trades | https://iss.moex.com/iss/reference/37 |
  | /iss/engines/[engine]/markets/[market]/boardgroups/[boardgroup]/orderbook | https://iss.moex.com/iss/reference/38 |

