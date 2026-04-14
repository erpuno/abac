defmodule ABAC.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :abac,
      version: "5.4.15",
      description: "ERP/1 ABAC Attribute Based Access Control",
      package: package(),
      deps: deps()
    ]
  end

  def package do
    [
      files: ~w(config include lib src mix.exs LICENSE README.md),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :abac,
      links: %{"GitHub" => "https://github.com/erpuno/abac"}
    ]
  end

  def application() do
    [
      mod: {:abac, []},
      extra_applications: [ :mnesia, :form, :nitro, :kvs, :erp ]
    ]
  end

  def deps() do
    [
    deps = [
      {:kvs, "~> 13.4.15"},
      {:erp, "~> 7.4.15"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]

    if System.get_env("KVS_BACKEND") == "rocksdb" do
      deps ++ [{:rocksdb, "~> 2.5", optional: true}]
    else
      deps
    end
  end
end
