defmodule ABAC do
  require Record

  hrl = ["abac/include/acid.hrl"]
  Enum.each(hrl, &(
                    Enum.each(Record.extract_all(from_lib: &1), fn {name, definition} ->
                                                                  Record.defrecord(name, definition)
                                                                end)
  ))

  defmacro __using__(opts \\ []) do
    imports =
      opts
      |> Macro.expand(__CALLER__)
      |> Keyword.get(:with, [:abac])

    Enum.map(imports, fn mod ->
      if Code.ensure_compiled(mod) do
        upcased = Module.concat([String.upcase(to_string(mod))])

        quote do
          import unquote(upcased)
          alias unquote(mod), as: unquote(upcased)
        end
      else
        IO.warn(
          "🚨 Unknown module #{mod} was requested to be used by :abac. Skipping."
        )
      end
    end)
  end
end
