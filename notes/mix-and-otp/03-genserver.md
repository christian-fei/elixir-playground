we used an agent to keep track of the bucket to put the grocery items in it.

we could potentially expose this as an api accessible by the clients, and be done.

but this exposes an important vulnerability, namely that each bucket in the system
has an unique name (read: atoms) and they are not garbage collected.

So malicious clients could exhaust the VM memory without any restriction.

What we want to do instead is having a central registry that keeps track of
bucket names and associated pids.

We need to ensure that this registry process is always up to date with the
current state of the bucket processes (e.g. if one crashes, what should it do?)

This is often called in erlang that the registry process *monitors* each bucket.

This is where the GenServer (generic server) abstraction from Erlang/Elixir comes
in.




## Our first GenServer

A GenServer is implemented in two parts: client and server API.
They can be implemented in the same or separate module.
The client and server run in separate processes