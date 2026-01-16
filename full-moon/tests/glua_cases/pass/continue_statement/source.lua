-- Test continue statement in loops
for i = 1, 10 do
    if i == 5 then
        continue
    end
    print(i)
end

-- Continue in while loop
while true do
    local value = getValue()
    if value == nil then
        continue
    end
    process(value)
end

-- Continue with conditional
for k, v in pairs(data) do
    if v == 0 then
        continue
    end
    doWork(v)
end

-- Continue in nested loop
for i = 1, 5 do
    for j = 1, 5 do
        if j == i then
            continue
        end
        print(i, j)
    end
end

-- Continue in repeat-until
repeat
    local item = getNext()
    if not item then
        continue
    end
    handle(item)
until done()

-- Continue is still valid as identifier outside loops
continue()
local continue = 10
continue.method()
