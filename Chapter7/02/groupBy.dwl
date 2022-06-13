%dw 2.0
output application/dw

var arrayObject = [
    {
        id: 1,
        name: "alex",
        email: "alex@fakeemail.com"
    },
    {
        id: 2,
        name: "akshata",
        email: "akshata@fakeemail.com"
    },
    {
        id: 3,
        name: "arul",
        email: "arul@fakeemail.com"
    }
]
var groupedByEmail = arrayObject groupBy ((item, index) -> item.email)

var dynamicInputEmail = "arul@fakeemail.com"
---
groupedByEmail[dynamicInputEmail][0]
//(arrayObject filter $.email == dynamicInputEmail)[0]