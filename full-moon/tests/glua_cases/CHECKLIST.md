# GLua Test Cases Verification Checklist

This checklist ensures all GLua test cases are complete and properly structured.

## Test Case Completeness

### Pass Cases Directory Structure
- [x] `pass/all_features_minimal/` - Minimal example
- [x] `pass/c_style_multi_line_comment/` - `/* */` comments
- [x] `pass/c_style_single_line_comment/` - `//` comments
- [x] `pass/continue_statement/` - continue keyword
- [x] `pass/edge_cases/` - Edge cases
- [x] `pass/logical_and_operator/` - `&&` operator
- [x] `pass/logical_or_operator/` - `||` operator
- [x] `pass/mixed_operators/` - Combined features
- [x] `pass/not_equal_operator/` - `!=` operator
- [x] `pass/operator_precedence/` - Precedence rules
- [x] `pass/real_world_example/` - Real-world code

### Required Files Per Test Case
Each test directory should have:
- [x] `source.lua` - Test source code
- [ ] `ast.snap` - AST snapshot (auto-generated on first run)
- [ ] `tokens.snap` - Token snapshot (auto-generated on first run)

## Feature Coverage Verification

### Operators
- [x] `!=` operator basic usage
- [x] `!=` with other operators
- [x] `!=` in all contexts (if/while/return/expressions)
- [x] `&&` operator basic usage
- [x] `&&` chained (multiple in sequence)
- [x] `&&` short-circuit behavior
- [x] `||` operator basic usage
- [x] `||` chained (multiple in sequence)
- [x] `||` short-circuit behavior
- [x] Mixed `&&` and `||` in same expression

### Comments
- [x] `//` single-line comments
- [x] `//` inline (after code)
- [x] `//` consecutive lines
- [x] `//` with special characters
- [x] `//` empty comment
- [x] `/* */` multi-line comments
- [x] `/* */` single-line block
- [x] `/* */` inline comments
- [x] `/* */` with special characters
- [x] `/* */` empty comment
- [x] Mixed comment styles together

### Continue Statement
- [x] `continue` in for loops (numeric)
- [x] `continue` in for loops (generic)
- [x] `continue` in while loops
- [x] `continue` in repeat-until loops
- [x] `continue` in nested loops
- [x] `continue` as identifier (outside loops)
- [x] `continue` as function name
- [x] `continue` as variable name

### Operator Precedence
- [x] `&&` vs `||` precedence
- [x] `!=` vs arithmetic operators
- [x] Parentheses override
- [x] Left associativity
- [x] Comparison operator precedence
- [x] Unary operators with GLua operators

### Edge Cases
- [x] Operators without whitespace
- [x] Operators with extra whitespace
- [x] Empty comments
- [x] Comments in table constructors
- [x] Comments in function arguments
- [x] All literal types with operators
- [x] Nested conditions
- [x] continue as identifier in various contexts

### Real-World Scenarios
- [x] Object-oriented patterns
- [x] Game loop simulation
- [x] Complex conditional logic
- [x] All features used naturally together
- [x] Typical GLua coding patterns

## Test Quality Checks

### Code Coverage
- [x] Each operator tested in isolation
- [x] Each operator tested in combination
- [x] Each comment style tested alone
- [x] Comments mixed with code
- [x] All statement types covered
- [x] Various expression contexts

### Test Clarity
- [x] Comments explain what's being tested
- [x] Test names are descriptive
- [x] Each test focuses on specific feature
- [x] Mixed tests clearly document all features used

### Documentation
- [x] README.md exists and is complete
- [x] TEST_SUMMARY.md exists and is complete
- [x] INDEX.md exists and is complete
- [x] CHECKLIST.md exists (this file)
- [x] Each test's purpose is documented

## Integration Requirements

### Code Changes Needed (Not in Test Files)
These must be implemented for tests to pass:

- [ ] `Cargo.toml` - Add `glua = []` feature flag
- [ ] `ast/versions.rs` - Add VERSION_GLUA constant
- [ ] `ast/versions.rs` - Add `glua()`, `with_glua()`, `has_glua()` methods
- [ ] `tokenizer/structs.rs` - Add `ExclamationEqual` symbol
- [ ] `tokenizer/structs.rs` - Add `DoubleAmpersand` symbol
- [ ] `tokenizer/structs.rs` - Add `DoublePipe` symbol
- [ ] `tokenizer/structs.rs` - Update CStyleComment feature flag
- [ ] `tokenizer/lexer.rs` - Handle `!` character
- [ ] `tokenizer/lexer.rs` - Handle `&&` sequence
- [ ] `tokenizer/lexer.rs` - Handle `||` sequence
- [ ] `tokenizer/lexer.rs` - Handle `//` comments (GLua)
- [ ] `tokenizer/lexer.rs` - Share `/* */` with cfxlua
- [ ] `ast/mod.rs` - Add BinOp variants for GLua
- [ ] `ast/mod.rs` - Update LastStmt::Continue feature flag
- [ ] `ast/parsers.rs` - Update continue parsing for GLua
- [x] `tests/pass_cases.rs` - Add test_glua_pass_cases function

## Test Execution Checklist

Before committing, verify:

### Build
- [ ] `cargo build --features glua` succeeds
- [ ] `cargo build --all-features` succeeds
- [ ] No compiler warnings for GLua code

### Test Run
- [ ] `cargo test --features glua` passes all tests
- [ ] `cargo test --all-features` passes all tests
- [ ] Snapshot files are generated correctly
- [ ] No test failures or panics

### Snapshot Verification
- [ ] AST snapshots look correct
- [ ] Token snapshots include all tokens
- [ ] Trivia (comments, whitespace) preserved
- [ ] Round-trip parsing works (parse → print
