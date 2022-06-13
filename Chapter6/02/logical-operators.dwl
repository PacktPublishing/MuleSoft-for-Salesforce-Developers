%dw 2.0
output application/dw
---
{
    "not": not 1 == 2, // true
    "!": ! (1 ~= "1"), // false
    "and": (5 > 2) and (4 < 9), // true
    "or": (1 >= 5) or (3 >= 3), // true
    Precendence: {
        not: not true or true, // false
        // not true or true = not (true or true) = not (true) = false
        "!": ! true or true, // true
        // ! true or true = (! true) or true = (false) or true = true
        "!()": ! (true or true) // false
        // ! (true or true) = ! (true) = false
    }
}