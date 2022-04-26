%dw 2.0
output application/dw
---
{
    Addition: {
        DateTimes: |2020-01-01| + |P2D|, // = |2020-01-03|
        Numbers: 1 + 2, // = 3
        Array: ["a", "b"] + "c" // = ["a", "b", "c"]
    },
    Subtraction: {
        DateTimes: |2020-01-03| - |P1D|, // = |2020-01-02|
        Numbers: 3 - 1, // = 2
        Array: ["a", "b", "c"] - "a", // = ["b", "c"]
        Object: { k1:"v1", k2:"v2" } - "k1" // = { k2: "v2" }
    },
    Multiplication: {
        Numbers: 3 * 3 // = 9
    },
    Division: {
        Numbers: 9 / 3 // = 3
    }
}