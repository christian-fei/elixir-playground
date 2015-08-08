defmodule Bucket do
  def start_link do
    Agent.start_link fn -> [] end
  end

  def get(bucket_agent_pid) do
    Agent.get bucket_agent_pid, fn list -> list end
  end

  def put(bucket_agent_pid, item) do
    Agent.update(bucket_agent_pid, fn bucket -> [item | bucket] end)
  end
end
