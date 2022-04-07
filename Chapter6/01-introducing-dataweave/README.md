# Introducing DataWeave

Find here the scripts used for Chapter 6, Transform with DataWeave.

You can either copy and paste from this README directly, or you can go to the corresponding file.

## Diving into a script's anatomy

`basic-script.dwl`

```dataweave
%dw 2.0
output application/json
---
"Hello World"
```

## Adding comments to your code

`single-comments.dwl`

```dataweave
%dw 2.0
output application/json
---
"Hello World" // this is a comment
```

`multi-line-comments.dwl`

```dataweave
%dw 2.0
output application/json
---
/* This is a comment
 * ...a multi-line comment.
 * And it ends here */
"Hello World" 
// this is a single-line comment
```

## Understanding data formats

`csv-format.csv`

```csv
firstName,lastName,pronouns
Appy,the Bobcat,She/Her
Astro,Nomical,They/Them
Max,the Mule,He/Him
```

`dw-format.dwl`

```dataweave
[
  {
    firstName: "Appy",
    lastName: "the Bobcat",
    pronouns: "She/Her"
  }, 
  {
    firstName: "Astro",
    lastName: "Nomical",
    pronouns: "They/Them"
  }, 
  {
    firstName: "Max",
    lastName: "the Mule",
    pronouns: "He/Him"
  }
]
```

`java-format.txt`

```java
[{firstName=Appy, lastName=the Bobcat, pronouns=She/Her}, {firstName=Astro, lastName=Nomical, pronouns=They/Them}, {firstName=Max, lastName=the Mule, pronouns=He/Him}]
```

`json-format.json`

```json
[
  {
    "firstName": "Appy",
    "lastName": "the Bobcat",
    "pronouns": "She/Her"
  },
  {
    "firstName": "Astro",
    "lastName": "Nomical",
    "pronouns": "They/Them"
  },
  {
    "firstName": "Max",
    "lastName": "the Mule",
    "pronouns": "He/Him"
  }
]
```