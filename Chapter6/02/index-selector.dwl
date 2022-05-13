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