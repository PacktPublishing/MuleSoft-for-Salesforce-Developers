# Part 2: Using the DataWeave Core functions

Find here the scripts or snippets used for Chapter 7, Transform with DataWeave.

You can either copy and paste from this README directly, or you can go to the corresponding file.

## Multi-type functions

`isEmpty.dwl`

```dataweave
%dw 2.0
output application/dw
---
{
    Array: isEmpty([]), // true
    String: isEmpty(""), // true
    Object: isEmpty({}), // true
    Null: isEmpty(null) // true
}
```

`log.dwl`

```dataweave
%dw 2.0
output application/json
---
[1, 2, 3] map log($)
```

`then.dwl`

```dataweave
%dw 2.0
output application/json
---
// [1, 2] + [3] // original
// flatten([1, 2] + [3]) // regular flatten
[1, 2] + [3] then flatten($) // using then
```

## Arrays

`groupBy.dwl`

```dataweave
%dw 2.0
output application/dw

var arrayObject = [
    {
        id: 1,
        name: "alex",
        email: "alex@fakeemail.com"
    },
    {
        id: 2,
        name: "akshata",
        email: "akshata@fakeemail.com"
    },
    {
        id: 3,
        name: "arul",
        email: "arul@fakeemail.com"
    }
]
var groupedByEmail = arrayObject groupBy $.email
var dynamicInputEmail = "arul@fakeemail.com"
---
groupedByEmail[dynamicInputEmail]
//arrayObject filter $.email == dynamicInputEmail
```

`map.dwl`

```dataweave
%dw 2.0
output application/json
---
["a","b","c"] map {
    ($$): $
}
```

`reduce-simple.dwl`

```dataweave
%dw 2.0
output application/json
---
(1 to 10) as Array reduce ($$ + $) // output is 55
```

`reduce-complex.dwl`

```dataweave
%dw 2.0
output application/json
import update from dw::util::Values
var arr = [
    {
        code: "ABC",
        isNewGroup: false
    },
    {
        code: "DEF",
        isNewGroup: true
    },
    {
        code: "GHI",
        isNewGroup: true
    },
    {
        code: "JKL",
        isNewGroup: false
    },
    {
        code: "MNO",
        isNewGroup: true
    }
]
---
arr reduce (item, acc=[]) -> do {
    var previousItem = acc[-1]
    var previousItemIndex = acc find previousItem
    ---
    if (item.isNewGroup or previousItem ~= null) 
        acc + item.code
    else 
        acc update previousItemIndex with "$previousItem,$(item.code)"
}
```