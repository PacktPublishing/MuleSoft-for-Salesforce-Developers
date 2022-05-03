%dw 2.0
output application/dw
fun plus(str1: String, str2: String): String = str1 ++ str2
fun plus(num1: Number, num2: Number): Number = num1 + num2
fun plus(data1, data2): Null = null
---
{
    Strings: plus("Hello ", "World"), // "Hello World"
    Numbers: plus(1, 2), // 3
    Others: plus(1, "World") // null
}