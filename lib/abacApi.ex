defmodule ABAC.API do
  require ABAC

  # PEP
  def decision(ABAC.request() = r), do: :erlang.apply(:"Elixir.ABAC.PDP", :decision, [r])
  def decision(_), do: false
end
