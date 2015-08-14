defmodule KV.HashDictBucket do
  def start_link do
    Agent.start_link fn -> HashDict.new end
  end

  def get(bucket) do
    Agent.get bucket, fn hash_dict -> hash_dict end
  end

  def put(bucket, key, value) do
    Agent.update(bucket, &HashDict.put(&1, key, value))
  end
end
