%dw 2.0
output application/json
---
(1 to 10) as Array reduce ($$ + $) // output is 55