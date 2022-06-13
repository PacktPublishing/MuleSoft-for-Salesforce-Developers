%dw 2.0
output application/dw
---
{
    Array: isEmpty([]), // true
    String: isEmpty(""), // true
    Object: isEmpty({}), // true
    Null: isEmpty(null) // true
}