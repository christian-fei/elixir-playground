defmodule KV.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  @registry_name KV.Registry

  def init(:ok) do
    children = [
      worker(KV.Registry, [[name: @registry_name]])
    ]

    supervise(children, strategy: :one_for_one)
  end
end