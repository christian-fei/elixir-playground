defmodule KV.Bucket do
  def start_link do
    Agent.start_link fn -> [] end
  end

  def get(bucket) do
    Agent.get bucket, fn list -> list end
  end

  def put(bucket, item) do
    Agent.update(bucket, fn bucket -> [item | bucket] end)
  end
end
