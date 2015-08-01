## utf-8 and unicode

in elixir, a string is a UTF-8 encoded binary, this i why `is_binary "hello"` evaluates to true.

there are so called code points, that represent a character value in the unicode list. it`s bigger than a byte, like `322 = ł`.

so `byte_size "hełło" = 7` and `String.length "hełło" = 5`



## binaries and bitstrings

a binary is a sequence of bytes, and you can define them with

```
x = <<1,2,3,4>>

byte_size x
  -> 4
```

The string concatenation operator `<>` is actualy a binary concatenation operator.

An interesting aspect is that you can pattern match with this operator (say destruct):

```
"he" <> rest = "hello"
```



## char lists

they are a, well, list of characters. In contrast to strings (which are binaries as we have seen):

```
'hełło'
  -> [104, 101, 322, 322, 111]
"hełło" == 'hełło'
  -> false
to_char_list "Hello"
  -> 'Hello'
to_string 'Hello'
  -> "Hello"
```


