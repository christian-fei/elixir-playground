one of elixir`s goals is extensibility.
sigils should allow that.
sigils consist of a `~`, a letter and a delimiter.


## regular expressions

regular expressions are created with the `~r` sigil

```
"foo" =~ ~r/foo|bar/
  -> true
"baz" =~ ~r/foo|bar/
  -> false
```

regular expressions in elixir follow [PCRE](http://www.pcre.org/)



## Strings, char lists and words sigils

`~s` is used to generate strings : `~s(hello) == "hello"`

`~c` is used to generate char lists: `~c(hello) == 'hello'`

`~w` is used to generate word lists: `~w(hello foo bar) == ["hello", "foo", "bar"]`

