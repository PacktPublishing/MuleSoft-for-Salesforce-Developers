%dw 2.0
output application/dw
---
((msg1, msg2 = "!") -> msg1 ++ msg2)("Hello ", "World")
// outputs "Hello World"