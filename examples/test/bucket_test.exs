defmodule BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket_pid} = Bucket.start_link
    {:ok, bucket_pid: bucket_pid}
  end

  test "gets elements in bucket", %{bucket_pid: bucket_pid} do
    assert [] == Bucket.get bucket_pid
  end

  test "puts element in bucket", %{bucket_pid: bucket_pid} do
    Bucket.put bucket_pid, "Bread"
    assert ["Bread"] == Bucket.get bucket_pid
  end
end