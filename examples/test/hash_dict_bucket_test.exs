defmodule HashDictBucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket_pid} = HashDictBucket.start_link
    {:ok, bucket_pid: bucket_pid}
  end

  test "gets elements in bucket", %{bucket_pid: bucket_pid} do
    expected = HashDict.new
    assert expected == HashDictBucket.get bucket_pid
  end

  test "puts element in bucket", %{bucket_pid: bucket_pid} do
    HashDictBucket.put bucket_pid, :bread, 1
    expected = HashDict.put(HashDict.new, :bread, 1)
    assert expected == HashDictBucket.get bucket_pid
  end
end