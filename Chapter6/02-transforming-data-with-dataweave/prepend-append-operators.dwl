%dw 2.0
output application/dw
---
{
    Prepend: {
        Array: 1 >> [2, 3], // [1, 2, 3]
        EmptyArray: 1 >> [], // [1]
        TimeZoneWithName: |2020-01-01T10:00:00-05:00| >> "America/Los_Angeles", // |2020-01-01T07:00:00-08:00|
        TimeZoneWithNumber: |2020-01-01T10:00:00-05:00| >> |-08:00| // |2020-01-01T07:00:00-08:00|
    },
    Append: {
        Array: [2, 3] << 1, // [2, 3, 1]
        EmptyArray: [] << 1 // [1]
    }
}