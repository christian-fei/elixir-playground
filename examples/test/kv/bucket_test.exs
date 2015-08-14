defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "gets elements in KV.Bucket", %{bucket: bucket} do
    assert [] == KV.Bucket.get bucket
  end

  test "puts element in KV.Bucket", %{bucket: bucket} do
    KV.Bucket.put bucket, "Bread"
    assert ["Bread"] == KV.Bucket.get bucket
  end
end