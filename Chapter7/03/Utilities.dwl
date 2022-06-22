%dw 2.0

fun getAuthorsNames(authors: Array): Array =
    authors map (
        ($.firstName default "")
        ++ " " ++
        ($.lastName default "")
    )