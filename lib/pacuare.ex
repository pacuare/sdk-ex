defmodule Pacuare do
  @moduledoc """
  An Elixir client for the [Pacuare](https://pacuare.dev) API.
  """
  defstruct [:api_key, :req]
  @type t() :: %__MODULE__{api_key: String.t(), req: Req.Request.t()}

  @doc """
  Create a client.

  ## Examples

      iex> Pacuare.new("your_api_key")
      {:ok, %Pacuare{api_key: "your_api_key"}}

  """
  @spec new(String.t(), String.t()) :: Pacuare.t()
  def new(api_key, base \\ "https://api.pacuare.dev/v1") do
    %Pacuare{
      api_key: api_key,
      req: Req.new(base_url: base, headers: %{authorization: "Bearer #{api_key}"})
    }
  end

  @doc """
  Query from the Pacuare dataset.
  """
  @spec query(Pacuare.t(), String.t(), list(any())) :: {:ok, Explorer.DataFrame.t()}
  def query(client, sql, params) do
    %Pacuare{req: req} = client

    {:ok, resp} = Req.post(req, url: "/query", json: %{query: sql, params: params})
    res = %Pacuare.Result{columns: resp.data["columns"], values: resp.data["values"]}
    {:ok, Explorer.DataFrame.new(res)}
  end
end
