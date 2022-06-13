# Part 2: Using the DataWeave Core functions

Find here the scripts or snippets used for Chapter 7, Transform with DataWeave.

You can either copy and paste from this README directly, or you can go to the corresponding file.

## Multi-type functions

`plusplus.dwl`

```dataweave
%dw 2.0
output application/dw
---
{
    Array: [1, 2] ++ [3, 4], // [1, 2, 3, 4]
    String: "Hello" ++ " " ++ "World" ++ "!", // "Hello World!"
    Object: { a: "b" } ++ { c: "d" }, // {"a":"b", "c":"d"}
    DateTime: |2020-01-01| ++ |10:00:00| // |2020-01-01T10:00:00|
}
```

`sizeOf.dwl`

```dataweave
%dw 2.0
output application/dw
---
{
    Array: sizeOf([0, 1, 2, 3]), // 4
    String: sizeOf("Hello World!"), // 12
    Object: sizeOf({"a":"b", "c":"d"}), // 2
    Null: sizeOf(null) // null
}
```

`typeOf.dwl`

```dataweave
%dw 2.0
output application/dw
---
{
    Array: typeOf([0, 1, 2, 3]), // Array
    String: typeOf("Hello World!"), // String
    Object: typeOf({"a":"b", "c":"d"}), // Object
    Null: typeOf(null), // Null
    Boolean: typeOf(true), // Boolean
    Number: typeOf(10), // Number
    Date: typeOf(|2020-01-01|), // Date
    Period: typeOf(|P1Y|) // Period
}
```

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

