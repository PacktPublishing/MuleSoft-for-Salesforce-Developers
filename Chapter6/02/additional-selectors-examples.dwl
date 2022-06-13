%dw 2.0
output application/dw
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