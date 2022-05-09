%dw 2.0
output application/dw
var value2 = 0
---
{
    key1: "value1",
    (key2: value2) if value2 != 0
} 
// outputs {key1:"value1"}