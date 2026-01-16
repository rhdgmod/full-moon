-- Test != operator (GLua alternative to ~=)
if a != b then
    print("not equal")
end

-- Mixed with other operators
local result = x != y and z != w

-- Multiple comparisons
if a != b and c != d or e != f then
    doSomething()
end

-- With numbers
if count != 0 then
    process()
end

-- With strings
if name != "default" then
    customize()
end

-- In conditions
while value != target do
    value = value + 1
end

-- In expressions
return foo != bar
