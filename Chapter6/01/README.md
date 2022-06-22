# Part 1: Introducing DataWeave

Find here the scripts or snippets used for Chapter 6, Learning DataWeave.

You can either copy and paste from this README directly, or you can go to the corresponding file.

## Script's anatomy

`basic-script.dwl`

```dataweave
%dw 2.0
output application/json
---
"Hello World"
```

## Comments

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
