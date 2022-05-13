%dw 2.0
output application/dw
---
{
    "not": {
        Example1: not true, // false
        Example2: not false, // true
        Example3: not 1 == 2 // true
    },
    "!": {
        Example1: ! true, // false
        Example2: ! false, // true
        Example3: ! (1 ~= "1") // false
    },
    "and": {
        Example1: true and true, // true
        Example2: true and false, // false
        Example3: false and false, // false
        Example4: (5 > 2) and (4 < 9) // true
    },
    "or": {
        Example1: true or true, // true
        Example2: true or false, // true
        Example3: false or false, // false
        Example4: (1 >= 5) or (3 >= 3) // true
    },
    Precendence: {
        not: not true or true, // false
        // not true or true = not (true or true) = not (true) = false

        "!": ! true or true, // true
        // ! true or true = (! true) or true = (false) or true = true
        
        "!()": ! (true or true) // false
        // ! (true or true) = ! (true) = false
    }
}