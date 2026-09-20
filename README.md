# The Vetri Programming Language

Vetri is a general-purpose programming language with stack-based expressions and structured control flows. It's lightweight and self-hosting.

It's in early stage of development and only supports `x86_64-linux` currently.

## Overview

### Hello World!

```text
"Hello World!\n" prints
```

### Literals

#### Integer

An integer is a sequence of decimal digits with or without a sign (`+` or `-`) prefix. It is automatically pushed onto the data stack (currently the x86 CPU stack).

Example:

```text
42 -67 +114
```

#### String

A string is a sequence of characters enclosed in double quotes and ended with zero (C-style string). C-style escape sequences are supported. Its address is automatically pushed onto the stack.

Example:

```text
"This is a string\n"
```

### Variable

A variable is a cell in memory and can be global or local. A legal variable name is a sequence of letters (`a-zA-Z`) and `_`.

Variables are not explicitly typed. A global variable is automatically declared when it is first assigned. Use `local` to declare a local variable in the current function scope.

#### Variable Declaration

Example:

```text
fn foo ( -- )
  local x
  0 -> x
  10 -> y
  x y + -> z
endfn
```

Here `x` is a local variable, while `y` and `z` are automatically declared as global variables.

#### Variable Manipulation

| Name  | Stack-effect | Usage     | Description                                                                             |
| ----- | ------------ | --------- | --------------------------------------------------------------------------------------- |
| `->`  | `value -- `  | `1 -> a`  | Assignment, automatically creates a global variable if it hasn't been declared as local |
| `+=>` | `value -- `  | `1 +=> a` | Add and assign                                                                          |
| `-=>` | `value -- `  | `2 -=> a` | Subtract and assign                                                                     |
| `*=>` | `value -- `  | `3 *=> a` | Multiply and assign                                                                     |
| `/=>` | `value -- `  | `4 /=> a` | Divide and assign                                                                       |
| `%=>` | `value -- `  | `5 %=> a` | Modulo and assign                                                                       |

### Function

A function is a callable segment of program, supporting recursive calling.

#### Function Definition

A function has a unique name and optional input and output arguments. Declare like this:

```text
fn <fn_name> ( <input args separated by space> -- <output args separated by space> )
  <function body>
endfn
```

The input arguments and output arguments are local variables and can be read and assigned by name.

`return` is optional. If a function does not have an explicit `return`, it will return several values from the data stack according to the number of output arguments.

Example:

```text
fn foo ( a b -- result )
  1 +=> a
  10 *=> b
  a b - -> result
  result return
endfn
```

### Struct

#### Struct Definition

A struct defines a named layout of fields.

```text
struct <name> <fields separated by space> endstruct
```

Example:

```text
struct Point x y endstruct
```

#### Struct Manipulation

`@type` is compile-time type information.

```text
new @<type> [<count>] -> <var>
<var> . @<type> <field>
<value> <var> .= @<type> <field>
```

The count after `@<type>` is optional. If omitted, `new` allocates enough memory for one object of the specified type.

`new` allocates storage for the specified number of objects and returns its address.

Example:

```text
struct Point x y endstruct
new @Point -> p

10 p .= @Point x
20 p .= @Point y

p . @Point x printi nl
p . @Point y printi nl

struct Line p1 p2 endstruct
new @Line -> l

p l .= @Line p1
new @Point l .= @Line p2

l . @Line p1 . @Point x printi nl
```

### Memory

Use `alloc size` to allocate static memory, counted in 8-byte cells, returning an address. It can be used as raw memory and fixed-size storage.

`new @type [count]` can be used to allocate storage for one or more objects of a struct type.

#### Manipulations

| Name       | Stack-effect              | Usage           | Description                                       |
| ---------- | ------------------------- | --------------- | ------------------------------------------------- |
| `[]`       | `index address -- value`  | `1 a []`        | Access by 8-byte cell                             |
| `[] @type` | `index address -- value`  | `1 a [] @Point` | Access an element using the specified type's size |
| `b[]`      | `index address -- value`  | `1 a b[]`       | Access by 1 byte                                  |
| `[]=`      | `value index address -- ` | `10 1 a []=`    | Assign by 8-byte cell                             |
| `b[]=`     | `value index address -- ` | `10 1 a b[]=`   | Assign by 1 byte                                  |

`@type` is optional for `[]`. Without it, `[]` accesses one 8-byte cell.

Example:

```text
"Hello World!" -> s
2 s b[] printc nl

alloc 8 -> a
67 5 a []=
```

### Operators

#### Arithmatics

| Name | Stack-effects    | Description         |
| ---- | ---------------- | ------------------- |
| `+`  | `a b -- a+b`     | Add                 |
| `-`  | `a b -- a-b`     | Subtraction         |
| `*`  | `a b -- a*b`     | Multiplication      |
| `/`  | `a b -- a/b`     | Division            |
| `%`  | `a b -- a%b`     | Modulo              |
| `/%` | `a b -- a/b a%b` | Division and modulo |

#### Stack

| Name   | Stack-effects    | Description                                                                   |
| ------ | ---------------- | ----------------------------------------------------------------------------- |
| `dup`  | `a -- a a`       | Duplicate the top of stack                                                    |
| `drop` | `a -- `          | Drop the top of the stack                                                     |
| `swap` | `a b -- b a`     | Swap the top 2 values of the stack                                            |
| `rot`  | `a b c -- b c a` | Rotate the top 3 values of the stack                                          |
| `over` | `a b -- a b a`   | Duplicate the value under the top value of the stack and push it onto the top |

#### Conditional

| Name  | Stack-effects | Description           |
| ----- | ------------- | --------------------- |
| `>`   | `a b -- bool` | Greater than          |
| `<`   | `a b -- bool` | Less than             |
| `>=`  | `a b -- bool` | Greater than or equal |
| `<=`  | `a b -- bool` | Less than or equal    |
| `==`  | `a b -- bool` | Equal                 |
| `!=`  | `a b -- bool` | Not equal             |
| `and` | `a b -- bool` | Logic and             |
| `or`  | `a b -- bool` | Logic or              |
| `not` | `a -- bool`   | Logic not             |

### Control Flow

#### `if...then...elif...then...else...endif`

Example:

```text
if 10 x < then
elif 20 x < then
else
endif
```

#### `while...do...endwhile`

Example:

```text
0 -> i
while i n < do
  1 +=> i
endwhile
```

#### Others

```text
1 exit
1 getargv
```

`exit` exits the program with the given error code.

`getargv` gets a command line argument by index.

### Built-in Functions

```text
printi   # print an integer to stdout
prints   # print a string
printc   # print an ASCII character
nl       # print a '\n'
erri     # print an integer to stderr
errs     # print a string to stderr
errc     # print an ASCII character to stderr
errnl    # print a '\n' to stderr
streq    # compare two strings and return 1 or 0
strlen   # return the length of a C-string
```
