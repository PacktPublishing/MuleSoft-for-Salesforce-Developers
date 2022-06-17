%dw 2.0
output application/json
---
// [1, 2] + [3] // original
// flatten([1, 2] + [3]) // regular flatten
[1, 2] + [3] then flatten($) // using then