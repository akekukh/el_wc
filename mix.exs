defmodule ElWc.MixProject do
  use Mix.Project

  def project do
    [
      app: :el_wc,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def deps do
    [
      {:flow, "~> 1.0"},
      {:mock, "~> 0.3.0", only: :test}
    ]
  end
end
