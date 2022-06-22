%dw 2.0
output application/json
import getAuthorsNames from dw::Utilities
---
getAuthorsNames(payload)