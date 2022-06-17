%dw 2.0
output application/json
---
["a","b","c"] map {
    ($$): $
}