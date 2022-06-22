# Part 3: Using the Transform Message component in Anypoint Studio

Find here the scripts or snippets used for Chapter 7, Transform with DataWeave.

You can either copy and paste from this README directly, or you can go to the corresponding file.

`authorsInput.json`

```json
[
  {
    "id": 1,
    "firstName": "Akshata",
    "lastName": "Sawant"
  },
  {
    "id": 2,
    "firstName": "Arul",
    "lastName": "Alphonse"
  },
  {
    "id": 3,
    "firstName": "Alex",
    "lastName": "Martinez"
  }
]
```

`payloadScript.dwl`

```dataweave
%dw 2.0
output application/json
---
payload
```

`Utilities.dwl`

```dataweave
%dw 2.0

fun getAuthorsNames(authors: Array): Array =
    authors map (
        ($.firstName default "")
        ++ " " ++
        ($.lastName default "")
    )
```

`UtilitiesMapping.dwl`

```dataweave
%dw 2.0
output application/json
import getAuthorsNames from dw::Utilities
---
getAuthorsNames(payload)
```
