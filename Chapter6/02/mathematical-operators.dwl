%dw 2.0
output application/dw
---
{
    Addition: |2020-01-01| + |P2D|, // = |2020-01-03|
    Subtraction: ["a", "b", "c"] - "a", // = ["b", "c"]
    Multiplication: 3 * 3, // = 9
    Division: 9 / 3 // = 3
}