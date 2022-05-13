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