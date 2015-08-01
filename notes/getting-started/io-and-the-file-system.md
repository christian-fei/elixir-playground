## the IO module

provides functions to read and write to IO devices (such as :stdio, :stderr, file etc.)

```
IO.puts "Hello"

IO.gets "Are you happy?"

IO.puts :stderr, "Something bad happened"
```



## the file/path module

contains functions to open files as IO devices. Files are opened in binary mode, thus it requires the usage
of IO.binwrite and IO.binwrite

The `Path` module is not interesting now



tldr
