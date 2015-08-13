defmodule HashDictBucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = HashDictBucket.start_link
    {:ok, bucket: bucket}
  end

  test "gets elements in bucket", %{bucket: bucket} do
    expected = HashDict.new
    assert expected == HashDictBucket.get bucket
  end

  test "puts element in bucket", %{bucket: bucket} do
    HashDictBucket.put bucket, :bread, 1
    expected = HashDict.put(HashDict.new, :bread, 1)
    assert expected == HashDictBucket.get bucket
  end
end