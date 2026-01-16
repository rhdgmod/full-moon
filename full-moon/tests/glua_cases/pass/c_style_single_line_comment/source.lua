// Test C-style single-line comments in GLua
print("Hello, World!")

// This is a comment
local x = 5 // inline comment

// Multiple comments
// on consecutive lines
local y = 10

// Comment before function
function test()
    // Comment inside function
    return true
end

// Comment before if
if x != y then
    // Comment in if block
    print("different")
end

local z = 42 // trailing comment with code

// Empty comment below
//
// Comment with special characters: !@#$%^&*()
// Comment with operators: != && ||

// Comment at end of file
