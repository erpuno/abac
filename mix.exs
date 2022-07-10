defmodule ABAC.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :abac,
      version: "1.7.2",
      elixir: "~> 1.8",
      description: "ABAC Attribute Based Access Control",
      package: package(),
      deps: deps()
    ]
  end

  def package do
    [
      files: ~w(doc include lib src mix.exs LICENSE),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :abac,
      links: %{"GitHub" => "https://github.com/erpuno/abac"}
    ]
  end

  def application() do
    [mod: {:abac, [:mnesia, :form, :nitro, :rocksdb, :kvs, :schema]}]
  end

  def deps() do
    [
      {:ex_doc, "~> 0.11", only: :dev},
      {:form, "~> 7.4.1"},
      {:bpe, "~> 7.6.4"},
      {:kvs, "~> 9.4.8"},
      {:schema, "~> 3.7.1"}
    ]
  end
end
