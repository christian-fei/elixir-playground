defmodule SimpleRegistryTest do
  use ExUnit.Case

  setup do
    {:ok, registry} = SimpleRegistry.start_link
    {:ok, registry: registry}
  end

  test "creates bucket in registry", %{registry: registry} do
    pid = SimpleRegistry.create(registry, "groceries")
    assert is_pid(pid)
  end

  test "does not create duplicate bucket", %{registry: registry} do
    pid = SimpleRegistry.create(registry, "groceries")
    assert is_pid(pid)
    assert SimpleRegistry.create(registry, "groceries") == :error
  end

  test "looks up bucket in registry", %{registry: registry} do
    assert SimpleRegistry.lookup(registry, "groceries") == :error
    SimpleRegistry.create(registry, "groceries")
    {:ok, pid} = SimpleRegistry.lookup(registry, "groceries")
    assert is_pid(pid)
  end

  test "cleans up bucket on exit", %{registry: registry} do
    SimpleRegistry.create(registry, "groceries")
    {:ok, pid} = SimpleRegistry.lookup(registry, "groceries")
    assert is_pid(pid)
    Agent.stop(pid)
    assert Process.alive?(pid) == false
    assert SimpleRegistry.lookup(registry, "groceries") == :error
  end

end