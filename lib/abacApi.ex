defmodule ABAC.API do
  require ABAC

  # PEP
  def decision(ABAC.request() = r), do: ABAC.PDP.decision(ABAC.request(r, type: :decision))

  def deny(ABAC.request() = r), do: ABAC.PDP.deny(ABAC.request(r, type: :deny))

  def get(ABAC.request() = r), do: ABAC.PDP.get(ABAC.request(r, type: :get))

  def parse(ABAC.request() = r), do: ABAC.PDP.parse(r)

end

