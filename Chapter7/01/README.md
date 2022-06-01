# Part 1: Understanding modules in DataWeave

Find here the scripts or snippets used for Chapter 7, Transform with DataWeave.

You can either copy and paste from this README directly, or you can go to the corresponding file.

## Importing modules and functions

`import-example-1.txt`

```
import Module
---
Module::function()
```

`import-example-2.txt`

```
import * from Module
---
function()
```

`import-example-3.txt`

```
import function from Module
---
function()
```

`import-example-4.txt`

```
import function1, function2, function3 from Module
---
function1()
```

`import-example-5.txt`

```
import function from Module1
import function from Module2
---
function() // from Module1
```

`import-example-6.txt`

```
import Module1
import Module2
---
Module2::function()
```

`import-example-7.txt`

```
import Module1 as Mod1 // alias Mod1 for Module1
import function1 as f1 from Module2 // alias f1 for function1
import function2 as f2, function3 as f3 from Module3 // aliases f2 and f3 for functions from the same module (Module3)
---
// Mod1::function
// f1()
// f2()
f3()
```

`import-example-8.txt`

```
import folder1::folder2::Module
---
Module::function()
```