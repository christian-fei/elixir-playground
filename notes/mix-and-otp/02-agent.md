we will write a module that is responsible for storing on key-value, so that it can be read and
written by multiple processes (like redis, but simpler)

## the trouble with state

In Elixir/Erlang we often make use of abstractions when we write our programs:

Some examples of patterns:

- Agent: simple wrappers around state

- GenServer: generic server, that encapsulates state, provide sync and async callbacks, code reloading, etc.

- GenEvent: event managers that allow publishing of events to multiple subscribers

- Task: async task, its values is retrieved later on


## Agents

As we said, agents are wrappers around state, and if you want a process to keep state, agents are a great fit.

We can start an Agent with 

```
{:ok, agent} = Agent.start_link fn -> [] end
```

and our agent has an initial state of an empty list.

We can update the state with `Agent.update`, like this:

```
Agent.update(agent, fn list -> ["eggs" | list] end)
```

In agents the concept of client and server is not so apparent, let`s see an example:

```
def push(item) do
  :timer.sleep 1000 # client sleeps
  Agent.update agent, fn list ->
    :timer.sleep 1000 # server sleeps
    [item | list]
  end)
end
```



