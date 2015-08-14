defmodule KV.Registry do
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
      {:ok, bucket} = KV.Bucket.start_link
      ref = Process.monitor(bucket)
      refs = HashDict.put(refs, ref, name)
      names = HashDict.put(names, name, bucket)
      {:reply, bucket, {refs, names}}
    end
  end

  def handle_info({:DOWN, ref, :process, _pid, _reason}, {names, refs}) do
    IO.puts "MAN DOWN!"
    IO.inspect ref
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