structs are an extension built on top of maps that provide compile-time checks and default values.

## defining structs

We use the `defstruct` macro, and they have the name of the module they are defined in:

```
defmodule User do
  defstruct name: "John", age: 27
end

user = %User{}
user1 = %User{name: "christian"}
```


## accessing and updating structs

access is done with a simple `.`, and update with `|`:

```
john = %User{name: "John"}
john.name

meg = %{john | name: "Meg"}
meg.name
```

You can also pattern match on structs, just like with maps:

```
%User{name: name} = john

name
  -> "John"
```



## Structs are just bare maps underneath

Pattern matching for example works, because structs are just maps underneath, and they store a property __struct__ that holds the struct name

```
is_map john
john.__struct__
```

Notice though that struct are *bare* maps underneath, they can`t be enumerated etc.
