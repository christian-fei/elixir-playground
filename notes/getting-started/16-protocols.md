protocols are a way to achieve polymorphism in elixir.

use the `defprotocol` construct to define a protocol:

```
defprotocol Quackable do
  def quacks?
end
```

and implement it for the various data types like this:

```
defimpl Quackable, for: Integer do
  def quacks?
    true
  end
end
```


## protocols and structs

Structs require their own implementation of a protocol:

```
defimpl Blank, for: User do
  def blank?(_), do: false
end
```



## Fallback to Any

with `@fallback_to_any true` in the protocol and `defimpl Blank, for: Any` you can provide fallback to Any for your protocol



## built-in protocols

Enum, Map, Inspect, String.Chars are the ones we know for now
