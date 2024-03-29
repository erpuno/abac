defmodule ABAC.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :abac,
      version: "0.11.3",
      elixir: "~> 1.8",
      description: "ABAC Attribute Based Access Control",
      package: package(),
      deps: deps()
    ]
  end

  def package do
    [
      files: ~w(doc src mix.exs LICENSE),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :abac,
      links: %{"GitHub" => "https://github.com/erpuno/abac"}
    ]
  end

  def application() do
    [mod: {:abac, []}]
  end

  def deps() do
    [
      {:ex_doc, "~> 0.11", only: :dev},
      {:form, "~> 5.8.7"}
    ]
  end
end
