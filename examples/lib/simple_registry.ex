defmodule SimpleRegistry do
  use GenServer

  def start_link(options \\ []) do
    GenServer.start_link(__MODULE__, :ok, options)
  end

  def create(server, bucket_name) do
    GenServer.call(server, {:create, bucket_name})
  end

  def lookup(server, bucket_name) do
    GenServer.call(server, {:lookup, bucket_name})
  end




  def init(:ok) do
    names = HashDict.new
    refs = HashDict.new
    {:ok, {refs,names}}
  end

  def handle_call({:lookup, name}, _from, {refs, names}), do: {:reply, HashDict.fetch(names, name), {refs,names}}
  def handle_call({:create, name}, _from, {refs, names}) do
    if HashDict.has_key?(names, name) do
      {:reply, :error, {refs,names}}
    else
      {:ok, bucket_pid} = Bucket.start_link
      ref = Process.monitor(bucket_pid)
      refs = HashDict.put(refs, ref, name)
      names = HashDict.put(names, name, bucket_pid)
      {:reply, bucket_pid, {refs, names}}
    end
  end

  def handle_info({:DOWN, ref, :process, _pid, _reason}, {names, refs}) do
    {name, refs} = HashDict.pop(refs, ref)
    names = HashDict.delete(names, name)

    {:noreply, {refs, names}}
  end

  def handle_info(msg, state) do
    IO.inspect msg
    IO.inspect state
    {:noreply, state}
  end
end