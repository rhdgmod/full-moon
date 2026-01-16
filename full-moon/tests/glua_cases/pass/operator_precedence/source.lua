-- Test operator precedence with GLua operators
-- Precedence should match standard Lua: && same as 'and', || same as 'or', != same as '~='

// Test && has higher precedence than ||
local a = true || false && false  -- Should parse as: true || (false && false)
local b = false && true || true   -- Should parse as: (false && true) || true

/* Test != with arithmetic operators */
local c = 1 + 2 != 3 + 4  -- Should parse as: (1 + 2) != (3 + 4)
local d = x * 2 != y / 2  -- Should parse as: (x * 2) != (y / 2)

// Test && and || with comparisons
local e = a < b && c > d  -- Should parse as: (a < b) && (c > d)
local f = x != y || z != w  -- Should parse as: (x != y) || (z != w)

/* Complex precedence tests */
local g = a + b != c && d || e  -- Should parse as: ((a + b) != c) && d) || e
local h = a && b != c || d && e  -- Should parse as: (a && (b != c)) || (d && e)

// Parentheses override precedence
local i = (a || b) && c
local j = a || (b && c)

/* Comparison operators have same precedence */
local k = a != b != c  -- Left associative: (a != b) != c
local l = x < y != z > w  -- ((x < y) != z) > w

// Multiple && operators
local m = a && b && c && d  -- Left associative: (((a && b) && c) && d)

/* Multiple || operators */
local n = a || b || c || d  -- Left associative: (((a || b) || c) || d)

// Mixing with arithmetic
local o = a + b && c * d  -- (a + b) && (c * d)
local p = x / y || z ^ w  -- (x / y) || (z ^ w)

/* Unary operators */
local q = not a && b  -- (not a) && b
local r = -x != y  -- (-x) != y
local s = #t || u  -- (#t) || u

// With function calls
local t = foo() && bar() || baz()
local u = getValue() != 0 && process()

/* String concatenation */
local v = "a" .. "b" != "ab"  -- ("a" .. "b") != "ab"
local w = s1 .. s2 && s3 .. s4  -- (s1 .. s2) && (s3 .. s4)

// All together
local result = a + b * c != d ^ e && f < g || h > i && not j
