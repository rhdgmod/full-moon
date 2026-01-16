-- Test mixing all GLua operators together
// C-style comment with GLua operators

/* Multi-line comment
   testing all features
*/

// Test != with && and ||
if a != b && c != d then
    print("first condition")
end

if x != y || z != w then
    print("second condition")
end

// Complex boolean expressions
local result = (a != b) && (c != d) || (e != f)

/* Test precedence */
if a && b || c && d != e then
    doSomething()
end

// Continue with GLua operators
for i = 1, 10 do
    if i != 5 && i != 7 then
        continue
    end
    print(i)
end

/* Nested conditions */
while running && count != max do
    if value != target || timeout then
        continue
    end
    process()
end

// All operators in one expression
if (a != b) && (c != d) || (e != f) then
    /* Process the result */
    for k, v in pairs(data) do
        if v != nil && v != 0 then
            // Skip invalid values
            continue
        end
    end
end

/* Test with function calls */
if isValid() && getValue() != 0 || hasDefault() then
    execute()
end

// Chained comparisons
local check = a != b && b != c && c != d || d != e

/* Mixed comment styles */
-- Lua style comment
// C++ style comment
/* C style comment */

// Complex nested example
if player != nil then
    if player.health != 0 && player.alive || player.invincible then
        /* Player can take action */
        for i = 1, 10 do
            if i == 5 then
                continue // Skip 5
            end
            takeDamage(i)
        end
    end
end

/* Test short-circuit evaluation */
local value = getValue() || getDefault()
local safe = checkValid() && processValue() || handleError()

// End of mixed operators test
