%dw 2.0
output application/dw
---
{
    LessThan: 1 < 2, // true
    GreaterThan: "a" > "b", // false
    LessOrEqualTo: |2020-01-01| <= |2020-01-01|, // true
    GreaterOrEqualTo: 1 >= 1, // true
    EqualTo: 1 == "1", // false
    SimilarTo: 1 ~= "1" // true
}