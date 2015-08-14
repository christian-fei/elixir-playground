defmodule KV.HashDictBucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.HashDictBucket.start_link
    {:ok, bucket: bucket}
  end

  test "gets elements in KV.Bucket", %{bucket: bucket} do
    expected = HashDict.new
    assert expected == KV.HashDictBucket.get bucket
  end

  test "puts element in KV.Bucket", %{bucket: bucket} do
    KV.HashDictBucket.put bucket, :bread, 1
    expected = HashDict.put(HashDict.new, :bread, 1)
    assert expected == KV.HashDictBucket.get bucket
  end
end