defmodule SEVOVV.Mixfile do
  use Mix.Project

  def project do
    [
      app: :sevovv,
      version: "1.1.1",
      description: "SEVOVV DIIA National Wide State Enterprise Document Bus",
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  def application do
    [mod: {SEVOVV, []}, applications: [:logger, :schema, :form, :nitro, :n2o, :kvs, :sax, :soa, :jsone, :ecsv, :bpe]]
  end

  def package do
    [
      files: ~w(lib mix.exs),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :sevovv,
      links: %{"GitHub" => "https://github.com/erpuno/sevovv"}
    ]
  end

  def docs do
    [
      main: "SEV",
      extras: ["README.md"],
      skip_undefined_reference_warnings_on: [:all],

      # Much stricter filter + only Elixir modules
      filter_modules: fn mod, _ ->
        mod_str = Atom.to_string(mod)
        (not String.starts_with?(mod_str, "Elixir.SEV")) and
        (not String.starts_with?(mod_str, "Elixir.NPA")) and
        (not String.starts_with?(mod_str, "Elixir.TEST."))
      end,

      # Extra safety
      ignore_apps: [:ex_doc, :eex]
    ]
  end

  def deps do
    [
      {:ex_doc, "~> 0.29.0", only: :dev},
      {:jsone, "~> 1.5.1"},
      {:schema, "~> 4.1.2"},
      {:soa, "~> 0.1.7"},
      {:smtp, "~> 1.1.2"},
      {:ecsv, "~> 1.4.2"},
      {:bpe, "9.9.7"},
      {:sax, "~> 1.0.0"},
      {:n2o, "~> 8.12.1"}
    ]
  end
end
