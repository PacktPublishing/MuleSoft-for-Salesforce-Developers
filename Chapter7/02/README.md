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

