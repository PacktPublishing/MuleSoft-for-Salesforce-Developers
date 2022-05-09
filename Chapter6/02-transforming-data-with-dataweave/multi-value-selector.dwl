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