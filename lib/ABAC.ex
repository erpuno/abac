defmodule ABAC do
  require Record

  files = ["abac.hrl", "objects.hrl", "request.hrl", "subjects.hrl"]

  hrl_files =
    Enum.filter(files, fn f ->
      !String.contains?(f, "/_") and Path.extname(f) == ".hrl"
    end)

  Enum.each(
    hrl_files,
    fn t ->
      Enum.each(
        Record.extract_all(from_lib: "abac/include/" <> t),
        fn {name, definition} ->
          prev = :application.get_env(:kernel, :nitro_tables, [])

          case :lists.member(name, prev) do
            true ->
              :skip

            false ->
              Record.defrecord(name, definition)
              :application.set_env(:kernel, :nitro_tables, [name | prev])
          end
        end
      )
    end
  )

end
