-- Test || operator (GLua alternative to or)
if a || b then
    print("at least one true")
end

-- Multiple conditions
local result = x || y || z

-- Mixed with comparisons
if count == 0 || name == "" then
    initialize()
end

-- Short-circuit evaluation
local value = tryFirst() || trySecond()

-- Complex conditions
if (a > b) || (c < d) || (e != f) then
    doSomething()
end

-- With function calls
if hasDataA() || hasDataB() then
    process()
end

-- Nested expressions
local check = (x || y) || (z || w)

-- Default value pattern
local name = getName() || "default"

-- In while loop
while isDone() || hasError() do
    break
end

-- Mixed with and (&&)
if a || b && c then
    execute()
end

-- Precedence test
if a && b || c && d then
    run()
end

-- In expressions
return foo || bar
