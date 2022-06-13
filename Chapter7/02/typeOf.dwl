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