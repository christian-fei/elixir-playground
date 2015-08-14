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
The client and server run in separate processes.

### call, cast or info?

- `handle_call` is used for synchronous requests.
- `handle_cast` is used for asynchronous requests, when you don't care about a reply.
A cast does not even guarantee that the server received the message
- `handle_info` is used for every other request that is not done via `call`, `cast` or `send`


## Monitors or links

Use links when you want linked crashes, and monitors when you want to be informed of crashes, exists...

Links are bi-directional. If one process exits, the other linked one will crash (unless it's trapping exists).
Monitors are uni-directional

In the example, the registry both links and monitors the buckets.
Which is not a good idea, because we don't want the registry to crash if a bucket goes down.
