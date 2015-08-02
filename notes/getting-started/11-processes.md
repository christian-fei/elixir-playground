Code runs in processes, which are isolated, run concurrent from each other and communicate via message-passing.
They are not to be confused with operating system processes, elixir/erlang processes are lightweight and have a low footprint on cpu and memory.

## spawn

`spawn` takes a function which will be executed in another process.

It returns a PID.

```
pid = spawn fn -> 1 + 2 end

Process.alive? pid
```

You can get hold of the current PID with `self()`



## send and receive

there are `send/2` and `receive/1`:

When you send a message to a process, it gets put into a so called "mailbox".

```
send self(), {:ok, "Hello"}

receive do
  {:ok, msg} ->
    IO.puts "Received message: #{mgs}"
end
```

You can specify a timeout in the receive block:

```
...

receive do
  ...
  after
    1_000 ->
      IO.puts "i was waiting and waiting but no one came"
  end
end
```



## Links

If you `spawn/1` a process, and the process fails, you get a log message, nothing more. This is because they 
are isolated from each other.

With `spawn_link/1` you can propagate the failure.

You can also manually link to a running process with `Process.link/1`




## Tasks

`Task.start/1` and `Task.start_link` provide better logging and enable the use in supervision trees.

They return `{:ok, pid}`



# State

To keep track of state, you often have a loop to maintain it in memory.

You update it by passing it around in a modified version.

`Agent` is a abstraction provided by elixir around state.

Elixir and Erlang provide APIs for building generic servers (GenServer), generic event handler 
(GenEvent).


