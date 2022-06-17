%dw 2.0
output application/json
import update from dw::util::Values
var arr = [
    {
        code: "ABC",
        isNewGroup: false
    },
    {
        code: "DEF",
        isNewGroup: true
    },
    {
        code: "GHI",
        isNewGroup: true
    },
    {
        code: "JKL",
        isNewGroup: false
    },
    {
        code: "MNO",
        isNewGroup: true
    }
]
---
arr reduce (item, acc=[]) -> do {
    var previousItem = acc[-1]
    var previousItemIndex = acc find previousItem
    ---
    if (item.isNewGroup or previousItem ~= null) 
        acc + item.code
    else 
        acc update previousItemIndex with "$previousItem,$(item.code)"
}