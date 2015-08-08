defmodule HashDictBucket do
  def start_link do
    Agent.start_link fn -> HashDict.new end
  end

  def get(bucket_agent_pid) do
    Agent.get bucket_agent_pid, fn hash_dict -> hash_dict end
  end

  def put(bucket_agent_pid, key, value) do
    Agent.update(bucket_agent_pid, &HashDict.put(&1, key, value))
  end
end
