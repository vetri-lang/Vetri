# The Vetri Programming Language

Vetri is a general-purpose programming language with stack-based expressions and structured control flows. It's light-weighted and self-hosting. 

It's in early stage of development and only support `x86_64-linux` currently.

## Overview

### Hello World!

```
"Hello World!\n" prints
```

### Literals

#### Interger

An integer is a sequence of decimal digits with or without a sign (`+` or `-`) prefix. Automatically pushed onto then data stack (currently the x86 CPU stack).

Example:

```
42 -67 +114
```

#### String

A string is a sequence of characters enclosed in double quotes and ended with zero (C-style string). Allow C-style escape sequences. Automatically push its address onto the stack.

Example:

```
"This is a string\n"
```

### Variable

A variable is a cell in memory, could be global or local. A legal variable name is a sequece of letters (`a-zA-Z`) and `_`.

#### Variable Declaration

Automatically declared as a global variable when being assigned the first time.Use `local` to declare it as a local variable in current function scope.

Example:

```
fn foo ( -- )
  local x # x is a local variable
  0 -> x # local variable x is set to value 0
  10 -> y # y is first used here and is recognized as a global variable
  x y + -> # now global variable y is set to this new value
endfn
```

#### Variable Manipulation

| Name | Stack-effect | Usage | Description |
| --- | --- | --- | --- |
| `->` | `value -- ` | `1 -> a` | Assignment, automatically create a global variable while the variable haven't be declared as a local variable or be assigned |
| `+=>` | `value -- ` | `1 +=> a` | Add and assign |
| `-=>` | `value -- ` | `2 -=> a` | Substract and assign |
| `*=>` | `value -- ` | `3 *=> a` | Multiply and assign |
| `/=>` | `value -- ` | `4 /=> a` | Divide and assign |
| `%=>` | `value -- ` | `5 %=> a` | Modulu and assign |

### Function

A function is a callable segement of program, supporting recursive calling.

#### Function Definition

A function has an unique name and optional input and output arguments. Declare like this:

```
fn <fn_name> ( <inputs args seperated by space> -- <outputs args seperated by space> )
  <function body>
endfn
```

`return` expression is optional. If a function doesn't have a explicit return, it will pop several values from data stack according to output arguments' number.

The input arguments and output arguments are all local variables and can be read and assign by name.

Example:

```
fn foo ( a b -- result )
  1 +=> a
  10 *=> b
  a b - => result
  result return # optional
endfn
```

### Struct

#### Struct Definition

Used as `struct <name> <fields seperated by space> endstruct`

Example:

```
struct Point x y endstruct
```

#### Struct Manipulation

```
new <struct name> -> var # create a struct, `new` actually return an address
var . <struct name> <field> # get the value of the field
value var .= <struct name> <field> # set the value of the field
```

Example:

```
struct Point x y endstruct
new Point -> p

10 p .= Point x
20 p .= Point y
p . Point x printi nl
p . Point y printi nl

struct Line p1 p2 endstruct
new Line -> l

p l .= Line p1 # reference to Point p
new Point l .= Line p2
```

### Memory

Use `alloc size` to allocate static memories (counted by 8 bytes), returning an address. Can be used as fixed-size arrays.

#### Manipulations

| Name | Stack-effect | Usage | Description |
| --- | --- | --- | --- |
| `[]` | `index variable -- value` | `1 a []` | Access by 8 bytes |
| `b[]` | `index variable -- value` | `1 a b[]` | Access by 1 byte |
| `[]=` | `value index variable -- ` | `10 1 a []=` | Assign by 8 bytes |
| `b[]=` | `value index variable -- ` | `10 1 a b[]=` | Assign by 1 byte |

Example:

```
"Hello World!" -> s
2 s b[] printc nl # put char s[2] 'l'

alloc 8 -> a
67 5 a []= # a[5] = 67
```

### Operators

#### Arithmatics

| Name | Stack-effects | Description |
| --- | --- | --- |
| `+` | `a b -- a+b` | Add |
| `-` | `a b -- a-b` | Substraction |
| `*` | `a b -- a*b` | Multiplication |
| `/` | `a b -- a/b` | Division |
| `%` | `a b -- a%b` | Modulu |
| `/%` | `a b -- a/b a%b` | Divison and modulu |

#### Stack

| Name | Stack-effects | Description |
| --- | --- | --- | --- |
| `dup` | `a -- a a` | Duplicate the top of stack |
| `drop` | `a -- ` | Drop the top of stack |
| `swap` | `a b -- b a` | Swap the top 2 value of the stack |
| `rot` | `a b c -- b c a` | Rotate the top 3 value of the stack |
| `over` | `a b -- a b a` | Duplicate the value under the top value of the stack and push it onto the top |

#### Conditional

| Name | Stack-effects | Description |
| --- | --- | --- |
| `>` | `a b -- bool` | Greater than |
| `<` | `a b -- bool` | Less than |
| `>=` | `a b -- bool` | Greater than or equal |
| `<=` | `a b -- bool` | Less than or equal |
| `==` | `a b -- bool` | Equal |
| `!=` | `a b -- bool` | Not equal |
| `and` | `a b -- bool` | Logic and |
| `or` | `a b -- bool` | Logic or |
| `not` | `a -- bool` | Logic not |

### Control FLow

#### `if...then...elif...then...else...endif`

Example:

```
if 10 x < then
elif 20 x < then
else
endif
```

#### `while...do...endwhile`

Example:

```
0 -> i
while i n < do
  1 +=> i
endwhile
```

#### Others

```
1 exit # exit with error code
1 getargv # get command line arguments by index
```

### Built-in Functions

```
printi # print an integer to stdout
prints # print a string
printc # print a ascii character
nl # print a '\n'
erri # print to stderr
errs
errc
errnl
streq # compare two strings and return 1 or 0
strlen # return the length of a c-string
```
