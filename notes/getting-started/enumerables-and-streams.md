## Enumerables

When we talk about Enumerables, the often used `Enum` module comes up.

It provide several functions to work with types that implement the `Enumerable` protocol.

Though the functions in `Enum` are polymorphic and useful in most cases, sometimes you need a 
specific function from a module for a certain implementation of `Enumerable`.
E.g. List.insert_at



## eager vs lazy

All the functions in the `Enum` module are eager. This means that when performing multiple operations, an intermediary list is generated every time.

```
1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum
```


## the pipe operator

it is similar to the `|` operator in the shell.

The example above rewritten without the pipe operator:

```
Enum.sum(Enum.filter(Enum.map(1..100_000, &(&1 * 3)), odd?))
```


# Streams

As an alternative to `Enum`, elixir provides the `Stream` module, which supports lazy operations.

Streams are just lazy, composable enumerables.
Instead of creating intermediary list, Stream create a list of operation that are only invoked when we pass it in the `Enum` module.

```
1..100_000 |> Stream.map(&(&1*2)) |> Enum.sum
```



