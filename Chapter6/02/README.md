# Part 2: Writing DataWeave scripts

Find here the scripts or snippets used for Chapter 6, Learning DataWeave.

You can either copy and paste from this README directly, or you can go to the corresponding file.

## Operators

`mathematical-operators.dwl`

```dataweave
%dw 2.0
output application/dw
---
{
    Addition: |2020-01-01| + |P2D|, // = |2020-01-03|
    Subtraction: ["a", "b", "c"] - "a", // = ["b", "c"]
    Multiplication: 3 * 3, // = 9
    Division: 9 / 3 // = 3
}
```

`equality-and-relational-operators.dwl`

```dataweave
%dw 2.0
output application/dw
---
{
    LessThan: 1 < 2, // true
    GreaterThan: "a" > "b", // false
    LessOrEqualTo: |2020-01-01| <= |2020-01-01|, // true
    GreaterOrEqualTo: 1 >= 1, // true
    EqualTo: 1 == "1", // false
    SimilarTo: 1 ~= "1" // true
}
```

`logical-operators.dwl`

```dataweave
%dw 2.0
output application/dw
---
{
    "not": not 1 == 2, // true
    "!": ! (1 ~= "1"), // false
    "and": (5 > 2) and (4 < 9), // true
    "or": (1 >= 5) or (3 >= 3), // true
    Precendence: {
        not: not true or true, // false
        // not true or true = not (true or true) = not (true) = false
        "!": ! true or true, // true
        // ! true or true = (! true) or true = (false) or true = true
        "!()": ! (true or true) // false
        // ! (true or true) = ! (true) = false
    }
}
```

`prepend-append-operators.dwl`

```dataweave
%dw 2.0
output application/dw
---
{
    Prepend: {
        Array: 1 >> [2, 3], // [1, 2, 3]
        EmptyArray: 1 >> [], // [1]
        TimeZoneWithName: |2020-01-01T10:00:00-05:00| >> "America/Los_Angeles", // |2020-01-01T07:00:00-08:00|
        TimeZoneWithNumber: |2020-01-01T10:00:00-05:00| >> |-08:00| // |2020-01-01T07:00:00-08:00|
    },
    Append: {
        Array: [2, 3] << 1, // [2, 3, 1]
        EmptyArray: [] << 1 // [1]
    }
}
```

## Variables

`simple-var.dwl`

```dataweave
%dw 2.0
output application/dw
var hello = "Hello World"
---
hello // outputs "Hello World"
```

`var-with-type.dwl`

```dataweave
%dw 2.0
output application/dw
var hello: String = "Hello World"
---
hello // outputs "Hello World"
```

`var-with-lambda.dwl`

```dataweave
%dw 2.0
output application/dw
var hello = (str) -> str
---
hello("Hello World") // outputs "Hello World"
```

## Functions

`simple-fun.dwl`

```dataweave
%dw 2.0
output application/dw
fun echo() = "Hello World"
---
echo() // outputs "Hello World"
```

`simple-fun-with-args.dwl`

```dataweave
%dw 2.0
output application/dw
fun echo(msg) = msg
---
echo("Hello World") // outputs "Hello World"
```

`simple-fun-opt-args.dwl`

```dataweave
%dw 2.0
output application/dw
fun echo(msg1, msg2 = "!") = msg1 ++ msg2 // ++ concatenates the strings
---
{
    twoArgs: echo("Hello ", "World"), // outputs "Hello World"
    oneArg: echo("Hello") // outputs "Hello!"
}
```

`lambda-in-var.dwl`

```dataweave
%dw 2.0
output application/dw
var echo = (msg1, msg2 = "!") -> msg1 ++ msg2 // ++ concatenates the strings
---
{
    twoArgs: echo("Hello ", "World"), // outputs "Hello World"
    oneArg: echo("Hello") // outputs "Hello!"
}
```

`lambda-in-body.dwl`

```dataweave
%dw 2.0
output application/dw
---
((msg1, msg2 = "!") -> msg1 ++ msg2)("Hello ", "World")
// outputs "Hello World"
```

`fun-overloading.dwl`

```dataweave
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
```

`sum-recursive-fun.dwl`

```dataweave
%dw 2.0
output application/dw
fun sum(number: Number): Number = 
    if (number > 0) 
        number + sum(number - 1)
    else 0
---
sum(3) // 6
```

`sumtail-recursive-fun.dwl`

```dataweave
%dw 2.0
output application/dw
fun sumtail(number: Number, result: Number = 0): Number = 
    if (number > 0) 
        sumtail(number - 1, result + number)
    else result
---
sumtail(3) // 6
```

## Selectors

`single-value-selector.dwl`

```dataweave
%dw 2.0
output application/dw
var objExample = {
    key1: "value1",
    key2: "value2",
    key2: "value2.1", // note this key is repeated (key2)
    key3: {
        "key3.1": "value3.1",
        "key3.2": {
            "key3.1": "value3.2"
        }
    }
}
---
{
    SingleValue1: objExample.key1, // "value1"
    SingleValue2: objExample.key2, // "value2"
    SingleValue3: objExample.key3, // {"key3.1":"value3.1","key3.2":{...}}
    SingleValue4: objExample."key3.1" // null
}
```

`multi-value-selector.dwl`

```dataweave
%dw 2.0
output application/dw
var objExample = {
    key1: "value1",
    key2: "value2",
    key2: "value2.1", // note this key is repeated (key2)
    key3: {
        "key3.1": "value3.1",
        "key3.2": {
            "key3.1": "value3.2"
        }
    }
}
---
{
    MultiValue1: objExample.*key1, // ["value1"]
    MultiValue2: objExample.*key2, // ["value2","value2.1"]
    MultiValue3: objExample.*key3, // [{"key3.1":"value3.1", ... }]
    MultiValue4: objExample.*"key3.1" // null
}
```

`descendants-selector.dwl`

```dataweave
%dw 2.0
output application/dw
var objExample = {
    key1: "value1",
    key2: "value2",
    key2: "value2.1", // note this key is repeated (key2)
    key3: {
        "key3.1": "value3.1",
        "key3.2": {
            "key3.1": "value3.2"
        }
    }
}
---
{
    Descendants1: objExample..key1, // ["value1"]
    Descendants2: objExample..key2, // ["value2"]
    Descendants3: objExample..key3, // [{"key3.1":"value3.1", ... }]
    Descendants4: objExample.."key3.1", // ["value3.1","value3.2"]
    Descendants5: objExample.."key3.2" // [{"key3.1":"value3.2"}]
}
```

`key-value-pair-selector.dwl`

```dataweave
%dw 2.0
output application/dw
var objExample = {
    key1: "value1",
    key2: "value2",
    key2: "value2.1", // note this key is repeated (key2)
    key3: {
        "key3.1": "value3.1",
        "key3.2": {
            "key3.1": "value3.2"
        }
    }
}
---
{
    KeyValuePair1: objExample.&key1, // {key1:"value1"}
    KeyValuePair2: objExample.&key2, // {key2:"value2",key2:"value2.1"}
    KeyValuePair3: objExample.&key3, // {key3:{...}}
    KeyValuePair4: objExample.&"key3.1" // null
}
```

`index-selector.dwl`

```dataweave
%dw 2.0
output application/dw
var objExample = {
    key1: "value1", // index 0 or -4
    key2: "value2", // index 1 or -3
    key2: "value2.1", // index 2 or -2
    key3: { //index 3 or -1
        "key3.1": "value3.1",
        "key3.2": {
            "key3.1": "value3.2"
        }
    }
}
var arrExample = [
    1, // index 0 or -6
    "Hello", // index 1 or -5
    key1: "value1", // index 2 or -4
    {key2: "value2"}, // index 3 or -3
    [2, 3], // index 4 or -2
    [4, [5, [6, 7]]] // index 5 or -1
]
---
{
    Index1: objExample[0], // "value1"
    Index2: objExample[-1], // {"key3.1":"value3.1","key3.2":{...}}
    Index3: arrExample[1], // "Hello"
    Index4: arrExample[-1], // [4,[5,[6,7]]]
    Index5: "Hello"[-4] // "e"
}
```

`range-selector.dwl`

```dataweave
%dw 2.0
output application/dw
var arrExample = [
    1, // index 0 or -6
    "Hello", // index 1 or -5
    key1: "value1", // index 2 or -4
    {key2: "value2"}, // index 3 or -3
    [2, 3], // index 4 or -2
    [4, [5, [6, 7]]] // index 5 or -1
]
---
{
    Range1: arrExample[0 to 3], // [1,"Hello",{key1:"value1"},{key2:"value2"}]
    Range2: arrExample[-1 to 0], // [[4,[5,[6,7]]], ... 1]
    Range3: "Hello"[-1 to 0], // "olleH"
    Range4: "Hello World"[0 to 4], // "Hello"
    Range5: "Hello World"[0 to -1] // "Hello World"
}
```

`additional-selectors-examples.dwl`

```dataweave
%dw 2.0
output application/json
var objExample = {
    key1: "value1",
    key2: "value2",
    key2: "value2.1",
    key3: {
        "key3.1": "value3.1",
        "key3.2": {
            "key3.1": "value3.2",
            key2: "value2.2"
        }
    }
}
var arrExample = [
    1, // index 0 or -6
    "Hello", // index 1 or -5
    key1: "value1", // index 2 or -4
    {key2: "value2"}, // index 3 or -3
    [2, 3], // index 4 or -2
    [4, [5, [6, 7]]] // index 5 or -1
]
var dynamicKey = "key1"
fun getDynamicKey(value: Number | String): String =
    "key" ++ value
---
{
    Example1: {
        MultiValue: objExample.*key2, // ["value2","value2.1"]
        Descendants: objExample..key2, // ["value2","value2.2"]
        Combined: objExample..*key2, // ["value2","value2.1","value2.2"]
        "Descendants-KeyValue": objExample..&key2 // [{"key2":"value2","key2":"value2.1"},{"key2":"value2.2"}]
    },
    Example2: {
        Object: objExample[-1][1][0], // "value3.2"
        Array: arrExample[-1][-1][-1][0], // 6
    },
    Example3: objExample[-1].."key3.1", // ["value3.1","value3.2"]
    Example4: {
        Dynamic1: objExample["key1"], // "value1"
        Dynamic2: objExample[dynamicKey], // "value1"
        Dynamic3: objExample[getDynamicKey(1)], // "value1"
        Dynamic4: objExample[getDynamicKey("1")] // "value1"
    }
}
```

## Scope and flow control

`simple-if-else.dwl`

```dataweave
%dw 2.0
output application/dw
var age: Number = 25
---
if (age >= 21) "Adult"
else "Minor"
// returns "Adult"
```

`chained-if-else.dwl`

```dataweave
%dw 2.0
output application/dw
var age: Number = -1
---
if (age >= 21) "Adult"
else if (age >= 0) "Minor"
else "Invalid data"
// returns "Invalid data"
```

`key-value-pair-if-condition.dwl`

```dataweave
%dw 2.0
output application/dw
var value2 = 0
---
{
    key1: "value1",
    (key2: value2) if value2 != 0
} 
// outputs {key1:"value1"}
```

`simple-match-case.dwl`

```dataweave
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
```

`local-context-do.dwl`

```dataweave
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
```

