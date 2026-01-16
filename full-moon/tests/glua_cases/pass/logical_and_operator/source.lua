-- Test && operator (GLua alternative to and)
if a && b then
    print("both true")
end

-- Multiple conditions
local result = x && y && z

-- Mixed with comparisons
if count > 0 && name != "" then
    process()
end

-- Short-circuit evaluation
local value = isValid() && getValue()

-- Complex conditions
if (a > b) && (c < d) && (e != f) then
    doSomething()
end

-- With function calls
if hasData() && canProcess() then
    run()
end

-- Nested expressions
local check = (x && y) && (z && w)

-- In while loop
while active && count < 10 do
    count = count + 1
end

-- Mixed with or (||)
if a && b || c && d then
    execute()
end

-- In expressions
return foo && bar
