%dw 2.0
output application/dw
var hello = (str) -> str
---
hello("Hello World") // outputs "Hello World"
