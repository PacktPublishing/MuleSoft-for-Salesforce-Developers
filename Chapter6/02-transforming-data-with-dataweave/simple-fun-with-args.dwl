%dw 2.0
output application/dw
fun echo(msg) = msg
---
echo("Hello World") // outputs "Hello World"