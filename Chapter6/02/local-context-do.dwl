%dw 2.0
output application/dw
fun sumtail(number: Number, result: Number = 0): Number = do {
    var newNumber = number - 1
    var newResult = result + number
    ---
    if (number > 0) 
        sumtail(newNumber, newResult)
    else result
}
---
sumtail(255) // 32640