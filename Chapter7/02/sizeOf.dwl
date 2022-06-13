%dw 2.0
output application/dw
---
{
    Array: sizeOf([0, 1, 2, 3]), // 4
    String: sizeOf("Hello World!"), // 12
    Object: sizeOf({"a":"b", "c":"d"}), // 2
    Null: sizeOf(null) // null
}