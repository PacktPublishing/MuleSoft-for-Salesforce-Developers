%dw 2.0
output application/dw
var echo = (msg1, msg2 = "!") -> msg1 ++ msg2 // ++ concatenates the strings
---
{
    twoArgs: echo("Hello ", "World"), // outputs "Hello World"
    oneArg: echo("Hello") // outputs "Hello!"
}