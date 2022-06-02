%dw 2.0
output application/dw
---
{
    Array: [1, 2] ++ [3, 4], // [1, 2, 3, 4]
    String: "Hello" ++ " " ++ "World" ++ "!", // "Hello World!"
    Object: { a: "b" } ++ { c: "d" }, // {"a":"b", "c":"d"}
    DateTime: |2020-01-01| ++ |10:00:00| // |2020-01-01T10:00:00|
}