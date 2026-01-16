-- Test edge cases for GLua syntax

// Test that 'continue' is still valid as identifier outside loops
continue()
local continue = 10
local x = continue
continue.method()
continue[1] = 5

/* Test operators that might be confused */
// != should not be confused with ! followed by =
local notBang = true
if notBang then
    x = 5
end

// && should not be confused with & followed by &
// || should not be confused with | followed by |

/* Test comments in various positions */
local a = 5 // comment after expression
local b = /* inline */ 10
local c = 1 /* mid */ + /* expression */ 2

// Test empty comments
//
/**/

/* Test comments with special content */
// Comment with // inside
// Comment with /* and */ inside
/* Comment with // inside */
/* Comment with nested-looking /* but not really */

-- Test mixing Lua and GLua comments
-- Lua comment
// GLua comment
/* GLua block */
--[[ Lua block ]]

// Test operators with whitespace
local d = a  !=  b
local e = x  &&  y
local f = p  ||  q

/* Test operators without whitespace */
local g = a!=b
local h = x&&y
local i = p||q

// Test in table constructors
local table = {
    a = x != y,
    b = p && q,
    c = m || n
}

/* Test in function arguments */
func(a != b, x && y, p || q)

// Test in return statements
function test()
    return a != b && c != d || e != f
end

/* Test continue in different loop types */
for i = 1, 10 do
    if i == 5 then continue end
end

while true do
    continue
end

for k, v in pairs({}) do
    continue
end

repeat
    continue
until false

// Test nested continues
for i = 1, 5 do
    for j = 1, 5 do
        if j == 2 then
            continue
        end
    end
    if i == 3 then
        continue
    end
end

/* Test operators in conditions with various types */
if nil != false then end
if 0 != false then end
if "" != nil then end
if {} != nil then end

// Test short-circuit behavior
local result1 = false && error("should not execute")
local result2 = true || error("should not execute")
local result3 = nil != 5 && getValue()

/* Test with ternary-like patterns */
local value = condition && trueValue || falseValue

// Test operators with all literal types
if 42 != 24 then end
if "hello" != "world" then end
if true != false then end
if nil != nil then end
if 3.14 != 2.71 then end

/* Test comment at EOF without newline */
// End of file
