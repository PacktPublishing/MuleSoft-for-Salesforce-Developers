%dw 2.0
output application/dw
var age: Number = -1
---
if (age >= 21) "Adult"
else if (age >= 0) "Minor"
else "Invalid data"
// returns "Invalid data"