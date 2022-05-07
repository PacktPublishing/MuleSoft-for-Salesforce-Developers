%dw 2.0
output application/dw
fun sum(number: Number): Number = 
    if (number > 0) 
        number + sum(number - 1)
    else 0
---
sum(3) // 6