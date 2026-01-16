// Test ! as unary NOT operator
if !ply:Alive() then
    respawn(ply)
end

local notValue = !getValue()

if !isValid && !isReady then
    wait()
end

// Combined with other operators
local result = !a && !b || !c

// With function calls
process(!ply:IsAdmin())

// Nested
local x = !!value  -- double negation

// Mixed with parentheses
if !(a && b) then end

// In expressions
return !condition
