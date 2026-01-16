// GLua minimal feature test
/* All GLua features in minimal form */

-- != operator
if a != b then end

-- && operator
if x && y then end

-- || operator
if p || q then end

-- continue statement
for i = 1, 10 do
    continue
end

-- All operators together
if a != b && c != d || e != f then
    for k, v in pairs(t) do
        if v != nil then
            continue
        end
    end
end
