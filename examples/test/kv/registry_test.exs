defmodule KV.RegistryTest do
  use ExUnit.Case

  setup do
    {:ok, registry} = KV.Registry.start_link
    {:ok, registry: registry}
  end

  test "creates KV.Bucket in registry", %{registry: registry} do
    pid = KV.Registry.create(registry, "groceries")
    assert is_pid(pid)
  end

  test "does not create duplicate KV.Bucket", %{registry: registry} do
    pid = KV.Registry.create(registry, "groceries")
    assert is_pid(pid)
    assert KV.Registry.create(registry, "groceries") == :error
  end

  test "looks up KV.Bucket in registry", %{registry: registry} do
    assert KV.Registry.lookup(registry, "groceries") == :error
    KV.Registry.create(registry, "groceries")
    {:ok, pid} = KV.Registry.lookup(registry, "groceries")
    assert is_pid(pid)
  end

  test "cleans up KV.Bucket on exit", %{registry: registry} do
    KV.Registry.create(registry, "groceries")
    {:ok, pid} = KV.Registry.lookup(registry, "groceries")
    assert is_pid(pid)
    assert Process.alive?(registry) == true
    Agent.stop(pid)
    assert Process.alive?(registry) == true
    assert Process.alive?(pid) == false
    assert KV.Registry.lookup(registry, "groceries") == :error
  end

end