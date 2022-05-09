%dw 2.0
output application/dw
var age: Number = 25
---
age match {
    case a if a >= 21 -> "Adult"
    case a if a >= 0 -> "Minor"
    else -> "Invalid Data"
}
// outputs "Adult"