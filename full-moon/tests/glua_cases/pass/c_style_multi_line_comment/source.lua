/* Test C-style multi-line comments in GLua */
print("Hello, World!")

/*
Multi-line comment
spanning multiple lines
*/
local x = 5

/* Single line block comment */
function test()
    /* Comment inside function */
    return true
end

/*
 * Comment with asterisks
 * on each line
 */
local y = 10

/* Inline comment */ local z = 20

/*
Comment before if statement
with multiple lines
*/
if x != y then
    print("different")
end

/* Comment with special chars: !@#$%^&*() */
/* Comment with operators: != && || */

/*
Empty lines in comment

Like this
*/

local data = {
    /* comment in table */
    value = 42
}

/* Comment at end of file */
