%dw 2.0
output application/dw
fun sumtail(number: Number, result: Number = 0): Number = 
    if (number > 0) 
        sumtail(number - 1, result + number)
    else result
---
sumtail(3) // 6