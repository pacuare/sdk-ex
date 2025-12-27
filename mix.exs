defmodule Pacuare.MixProject do
  use Mix.Project

  def project do
    [
      app: :pacuare_sdk,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "An Elixir client for the Pacuare SDK.",
      name: "Pacuare",
      source_url: "https://github.com/pacuare/sdk-ex",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.5"},
      {:explorer, "~> 0.11.1"},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "pacuare",
      # These are the default files included in the package
      files: ~w(lib priv .formatter.exs mix.exs README* readme* LICENSE*
                license* CHANGELOG* changelog* src),
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/pacuare/sdk-ex",
        "Website" => "https://pacuare.dev"
      }
    ]
  end
end
