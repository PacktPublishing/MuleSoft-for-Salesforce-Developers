%dw 2.0
output application/dw
var age: Number = 25
---
if (age >= 21) "Adult"
else "Minor"
// returns "Adult"