defmodule Pacuare.Result do
  defstruct [:columns, :values]
end

defimpl Table.Reader, for: Pacuare.Result do
  def init(data) do
    %Pacuare.Result{columns: columns, values: values} = data
    {:rows, %{columns: columns}, values}
  end
end
