we will write a module that is responsible for storing on key-value, so that it can be read and
written by multiple processes (like redis, but simpler)

## the trouble with state

In Elixir/Erlang we often make use of abstractions when we write our programs:

Some examples of patterns:

- Agent: simple wrappers around state

- GenServer: generic server, that encapsulates state, provide sync and async callbacks, code reloading, etc.

- GenEvent: event managers that allow publishing of events to multiple subscribers

- Task: async task, its values is retrieved later on


- 
