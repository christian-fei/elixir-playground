defmodule BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "gets elements in bucket", %{bucket: bucket} do
    assert [] == Bucket.get bucket
  end

  test "puts element in bucket", %{bucket: bucket} do
    Bucket.put bucket, "Bread"
    assert ["Bread"] == Bucket.get bucket
  end
end