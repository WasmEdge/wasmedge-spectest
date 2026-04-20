# Introduction

**WasmEdge-spectest** is a repository of spec test data extracted from WebAssembly (WASM) test suites.

* Test data is from [WebAssembly Core Tests](https://github.com/WebAssembly/spec/tree/master/test/core) and tests from each proposal.

* [S-Expression scripts](https://github.com/WebAssembly/spec/blob/main/interpreter/README.md#scripts) of tests are extracted into `json` and `wasm` files by the [wast2json](https://webassembly.github.io/wabt/doc/wast2json.1.html) tool in [wabt](https://github.com/WebAssembly/wabt).

* For WASM text formats not currently supported by [wabt](https://github.com/WebAssembly/wabt), parsing and conversion into binary files is done by [wasm-tools](https://github.com/bytecodealliance/wasm-tools).

* For the [Component Model](https://github.com/WebAssembly/component-model) tests, the `json-from-wast` command of [wasm-tools](https://github.com/bytecodealliance/wasm-tools) is used to extract `json` and `wasm` files.

## Folders

* `wasm-1.0`: The WASM 1.0 tests with the following proposal:
  * [Import/Export of Mutable Globals](https://github.com/WebAssembly/mutable-global)
* `wasm-2.0`: The WASM 2.0 tests with WASM 1.0 and the following proposals:
  * [Non-trapping float-to-int conversions](https://github.com/WebAssembly/nontrapping-float-to-int-conversions)
  * [Sign-extension operators](https://github.com/WebAssembly/sign-extension-ops)
  * [Multi-value](https://github.com/WebAssembly/multi-value)
  * [Reference Types](https://github.com/WebAssembly/reference-types)
  * [Bulk memory operations](https://github.com/WebAssembly/bulk-memory-operations)
  * [Fixed-width SIMD](https://github.com/webassembly/simd)
* `wasm-3.0` prefixed folders: The WASM 3.0 tests with WASM 1.0, WASM 2.0, and the following proposals:
  * [Exception handling](https://github.com/WebAssembly/exception-handling)
  * [Extended Constant Expressions](https://github.com/WebAssembly/extended-const)
  * [Typed Function References](https://github.com/WebAssembly/function-references)
  * [Garbage collection](https://github.com/WebAssembly/gc)
  * [Memory64](https://github.com/WebAssembly/memory64)
  * [Multiple memories](https://github.com/WebAssembly/multi-memory)
  * [Relaxed SIMD](https://github.com/WebAssembly/relaxed-simd)
  * [Tail call](https://github.com/WebAssembly/tail-call)
* `threads`: The tests for the [Threads](https://github.com/WebAssembly/threads) proposal.
* `exception-handling-legacy`: The legacy version of the [Exception handling](https://github.com/WebAssembly/exception-handling) proposal tests.
  * This is deprecated.
* `component-model`: The tests for the [Component Model](https://github.com/WebAssembly/component-model) proposal.

## Tags

### Active Tags

* `wasm-core-20260421`: Add tests for segment single-evaluation in `table.init`, `array.init_elem`, and `array.new_elem`

### Older Tags

* `wasm-core-20260326`: Fix SIMD proposal tests
* `wasm-core-20260322`: Fix threads and component-model proposal tests
* `wasm-core-20260319`: Update threads proposal tests and fix component-model proposal tests
* `wasm-core-20260316`: Fix component-model proposal tests
* `wasm-core-20260301`: Update test suite to 2026/03/01 and add component-model proposal tests
* `wasm-core-20251216`: Update test suite to 2025/12/16
* `wasm-core-20251029`: Update test suite to 2025/10/29 and rename folder names for WASM 3.0
* `wasm-core-20250217`: The test suite dated 2025/02/17 from the WASM spec and proposals

### Archived Tags

* This repo was moved from the old spec test repo. For older tags and history, please refer to the [WasmEdge-unittest repo](https://github.com/second-state/WasmEdge-unittest).
  * `wasm-core-20240217`: The test suite dated 2024/02/17 from the WASM spec
  * `wasm-core-20231026`: The test suite dated 2023/10/26 from the WASM spec
  * `wasm-core-20230511`: The test suite dated 2023/05/11 from the WASM spec
  * `wasm-core-20221215`: The test suite dated 2022/12/15 from the WASM spec
  * `wasm-core-20221026`: The test suite dated 2022/10/26 from the WASM spec
  * `wasm-core-20220712`: The test suite dated 2022/07/12 from the WASM spec
  * `wasm-core-20220504`: The test suite dated 2022/05/04 from the WASM spec
  * `wasm-core-20220223`: The test suite dated 2022/02/23 from the WASM spec
  * `wasm-core-20211214`: The test suite dated 2021/12/14 from the WASM spec
  * `wasm-core-20211119`: The test suite dated 2021/11/19 from the WASM spec
  * `wasm-core-20210414`: The test suite dated 2021/04/14 from the WASM spec

## Differences

### Trap Message Changes

* `wasm-2.0/select/select.wast` line 325: `invalid result arity` -> `type mismatch`
  * This error message is for the WAT format; the WASM format cannot detect this error from the bytecode.
* `wasm-3.0/select/select.wast` line 369: `invalid result arity` -> `type mismatch`
  * This error message is for the WAT format; the WASM format cannot detect this error from the bytecode.
* Updated error message text for older tests
  * Changed `global is immutable` to `immutable global` according to the latest test suite.
    * `wasm-1.0/global/global.wast` line 244
    * `wasm-2.0/global/global.wast` line 274, 279
  * Changed `malformed lane index` to `i8 constant out of range` according to the latest test suite.
    * `wasm-2.0/simd_lane/simd_lane.wast` line 415-428, 521, 525, 604, 608, 612, 616, 620

### Test Case Removals

* `wasm-3.0/instance` folder moved to `wasm-3.0-exceptions`
  * Temporarily moved this test set to the exception handling folder until the exception-handling proposal implementation for AOT/JIT is completed in WasmEdge.

### New S-Expression Grammar

The following S-Expression constructs are not supported by [wabt](https://github.com/WebAssembly/wabt). Their corresponding `.json` and `.wasm` files are generated manually or by other tools, with new command types introduced in the JSON format.

#### `"module_definition"` command

A new `"module_definition"` type in the commands array. It has the same structure as `"module"` but represents a module definition that is not automatically instantiated.

* Structure: `{"type": "module_definition", "line": N, "filename": "X.wasm"}`
* Used in:
  * `wasm-3.0/instance/instance.wast` line 3, 109
  * `wasm-3.0/memory/memory.wast` line 8
  * `wasm-3.0/table/table.wast` line 9
  * `wasm-3.0-memory64/memory64/memory64.wast` line 8
  * `wasm-3.0-memory64/table64/table64.wast` line 9

#### `"module_instance"` command

A new `"module_instance"` type in the commands array. It has a similar structure to `"register"`, but uses the `"definition"` field to reference the source module definition by name.

* Structure: `{"type": "module_instance", "line": N, "name": "$inst", "definition": "$def"}`
* Used in:
  * `wasm-3.0/instance/instance.wast` line 10, 11, 125

#### `"thread"` command

A new `"thread"` type for the [Threads](https://github.com/WebAssembly/threads) proposal test cases. It represents a concurrent thread of execution containing its own nested commands. Each module within a thread is compiled to a separate `.wasm` file.

* Structure: `{"type": "thread", "line": N, "name": "$T1", "shared": [...], "commands": [...]}`
  * `"name"`: the thread identifier (e.g. `"$T1"`).
  * `"shared"`: an array of shared module references from the `(shared (module $ref))` clause. Each entry is `{"module": "$ref"}`. Empty array `[]` when the thread has no `shared` clause.
  * `"commands"`: a nested array of standard commands (`module`, `register`, `action`, `assert_return`, `assert_unlinkable`, or nested `thread`, etc.) that execute within the thread.
* Used in:
  * `threads/simple/simple.wast` line 6
  * `threads/thread/thread.wast` line 6, 17, 41
  * `threads/wait_notify/wait_notify.wast` line 6, 19
  * `threads/LB/LB.wast` line 6, 23
  * `threads/LB_atomic/LB_atomic.wast` line 6, 23
  * `threads/MP/MP.wast` line 6, 18
  * `threads/MP_atomic/MP_atomic.wast` line 6, 18
  * `threads/SB/SB.wast` line 6, 23
  * `threads/SB_atomic/SB_atomic.wast` line 6, 23
  * `threads/nested/nested.wast` line 7, 21, 36
  * `threads/deeply_nested/deeply_nested.wast` line 8, 22, 33, 42, 52, 75
  * `threads/unlinkable/unlinkable.wast` line 5, 14

#### `"wait"` command

A new `"wait"` type for the [Threads](https://github.com/WebAssembly/threads) proposal test cases. It blocks execution until the referenced thread completes.

* Structure: `{"type": "wait", "line": N, "thread": "$T1"}`
  * `"thread"`: the name of the thread to wait on.
* Used in:
  * `threads/simple/simple.wast` line 18
  * `threads/thread/thread.wast` line 28, 29, 48
  * `threads/wait_notify/wait_notify.wast` line 39, 40
  * `threads/LB/LB.wast` line 41, 42
  * `threads/LB_atomic/LB_atomic.wast` line 41, 42
  * `threads/MP/MP.wast` line 38, 39
  * `threads/MP_atomic/MP_atomic.wast` line 38, 39
  * `threads/SB/SB.wast` line 41, 42
  * `threads/SB_atomic/SB_atomic.wast` line 41, 42
  * `threads/nested/nested.wast` line 32, 53, 54
  * `threads/deeply_nested/deeply_nested.wast` line 63, 64, 70, 71, 92, 93
  * `threads/unlinkable/unlinkable.wast` line 12, 21

#### `"either"` expected value

A new `"either"` type used in the `"expected"` array of `"assert_return"` for non-deterministic results in concurrent tests. It indicates the actual result may be any one of the provided alternatives.

* Structure: `{"type": "either", "values": [{"type": "i32", "value": "0"}, {"type": "i32", "value": "42"}]}`
* Used in:
  * `threads/thread/thread.wast` line 25

### Component-Model Spec Test Changes

* Removed tests from the old spec
  * `component-model/import/import.wast` line 345
  * `component-model/wrong-order/` all tests, because it's core WASM test and has diverge trap message from WASM spec.
* Trap message modifications for component-model tests (<https://github.com/WasmEdge/WasmEdge/pull/4666>):
  * `component-model/adapt/adapt.wast` line 81: `` canonical encoding option `utf8` conflicts with option `utf16` `` -> `canonical encoding option conflicts`
  * `component-model/adapt/adapt.wast` line 88: `` canonical encoding option `utf8` conflicts with option `latin1-utf16` `` -> `canonical encoding option conflicts`
  * `component-model/adapt/adapt.wast` line 95: `` canonical encoding option `utf16` conflicts with option `latin1-utf16` `` -> `canonical encoding option conflicts`
  * `component-model/adapt/adapt.wast` line 111: `` `memory` is specified more than once `` -> `` canonical option `memory` is specified more than once ``
  * `component-model/adapt/adapt.wast` line 255: `` unknown instance: failed to find name `$i` `` -> `unknown instance`
  * `component-model/adapt/adapt.wast` line 263: `` lowered parameter types `[]` do not match parameter types `[I32]` `` -> `lowered parameter types do not match parameter types`
  * `component-model/adapt/adapt.wast` line 271: `` lowered result types `[]` do not match result types `[I32]` `` -> `lowered result types do not match result types`
  * `component-model/adapt/adapt.wast` line 287: `` unknown core func: failed to find name `$f` `` -> `unknown core func`
  * `component-model/alias/alias.wast` line 114, 124: `` export `a` for instance 0 is not a module `` -> `alias unknown export module`
  * `component-model/alias/alias.wast` line 132, 140: `` core instance 0 has no export named `a` `` -> `alias unknown export name`
  * `component-model/alias/alias.wast` line 148: `` instance 0 has no export named `a` `` -> `alias unknown export name`
  * `component-model/alias/alias.wast` line 263, 271, 279: `invalid outer alias count of 100` -> `invalid outer alias count`
  * `component-model/definedtypes/definedtypes.wast` line 60, 67, 74: `type index 0 is not a defined type` -> `not a defined type`
  * `component-model/definedtypes/definedtypes.wast` line 97: `` record field name `A-b-C-d` conflicts with previous field name `a-B-c-D` `` -> `record field name conflicts with previous field name`
  * `component-model/definedtypes/definedtypes.wast` line 100: `` variant case name `x` conflicts with previous case name `x` `` -> `variant case name conflicts with previous case name`
  * `component-model/definedtypes/definedtypes.wast` line 103: `` flag name `X` conflicts with previous flag name `x` `` -> `flag name conflicts with previous flag name`
  * `component-model/definedtypes/definedtypes.wast` line 106: `` enum tag name `X` conflicts with previous tag name `x` `` -> `enum tag name conflicts with previous tag name`
  * `component-model/export-ascription/export-ascription.wast` line 44: `` missing expected export `f` `` -> `missing expected export`
  * `component-model/func/func.wast` line 21: `` function parameter name `FOO` conflicts with previous parameter name `foo` `` -> `function parameter name conflicts with previous parameter name`
  * `component-model/func/func.wast` line 135: `` invalid leading byte (0x1) for number of results `` -> `malformed defined type`
  * `component-model/func/func.wast` line 146: `` invalid leading byte (0x2) for component function results `` -> `malformed defined type`
  * `component-model/import/import.wast` line 24: `type index 0 is not an instance type` -> `unknown instance type`
  * `component-model/import/import.wast` line 31: `core type index 0 is not a module type` -> `unknown module type`
  * `component-model/import/import.wast` line 38: `type index 0 is not a function type` -> `unknown function type`
  * `component-model/import/import.wast` line 48, 56: `` duplicate import name `:` `` -> `duplicate import name`
  * `component-model/import/import.wast` line 64, 72: `` duplicate import name `:a` `` -> `duplicate import name`
  * `component-model/import/import.wast` line 79, 88: `` import name `a` conflicts with previous name `a` `` -> `import name conflicts with previous name`
  * `component-model/import/import.wast` line 126, 129, 202, 205, 208, 211, 214, 240, 243, 246, 249, 252: ``` `` is not in kebab case ``` -> `not in kebab case`
  * `component-model/import/import.wast` line 138: `` `wasi/http` is not in kebab case `` -> `not in kebab case`
  * `component-model/import/import.wast` line 141: `` `TyPeS` is not in kebab case `` -> `not in kebab case`
  * `component-model/import/import.wast` line 144: `` `WaSi` is not in kebab case `` -> `not in kebab case`
  * `component-model/import/import.wast` line 147: `` `HtTp` is not in kebab case `` -> `not in kebab case`
  * `component-model/import/import.wast` line 153: `unexpected character '.'` -> `unexpected character`
  * `component-model/import/import.wast` line 159: `unexpected character 'a'` -> `unexpected character`
  * `component-model/import/import.wast` line 162: `unexpected character 'b'` -> `unexpected character`
  * `component-model/import/import.wast` line 165: `unexpected character 'x'` -> `unexpected character`
  * `component-model/import/import.wast` line 177: `` trailing characters found: `/qux` `` -> `trailing characters found`
  * `component-model/import/import.wast` line 199, 237, 277: `` expected `<` at `` `` -> `` expected `<` ``
  * `component-model/import/import.wast` line 217: `` expected `{` at `>` `` -> `` expected `{` ``
  * `component-model/import/import.wast` line 223: `` `xyz` is not a valid semver `` -> `not a valid semver`
  * `component-model/import/import.wast` line 226: `` `1.2.3 >=2.3.4` is not a valid semver `` -> `not a valid semver`
  * `component-model/import/import.wast` line 255, 261: ``` expected `>` at `` ``` -> `` expected `>` ``
  * `component-model/import/import.wast` line 267: `` trailing characters found: `x` `` -> `trailing characters found`
  * `component-model/instance-types/instance-type.wast` line 185: `` export name `a` conflicts with previous name `a` `` -> `export name conflicts with previous name`
  * `component-model/instance-types/instance-type.wast` line 193: `type index 0 is not an instance type` -> `not an instance type`
  * `component-model/instance-types/instance-type.wast` line 201: `core type index 0 is not a module type` -> `not a module type`
  * `component-model/instance-types/instance-type.wast` line 216, 224, 234: `type index 0 is not a function type` -> `not a function type`
  * `component-model/instantiate/instantiate.wast` line 168: `` missing import named `a` `` -> `missing import`
  * `component-model/instantiate/instantiate.wast` line 178, 479: `expected func, found component` -> `expected func`
  * `component-model/instantiate/instantiate.wast` line 188: `expected a result, found none` -> `expected a result`
  * `component-model/instantiate/instantiate.wast` line 198: `expected 0 parameters, found 1` -> `type mismatch in function type`
  * `component-model/instantiate/instantiate.wast` line 212: `` type mismatch in import `::` `` -> `type mismatch in import`
  * `component-model/instantiate/instantiate.wast` line 224: `` missing expected import `::foobar` `` -> `missing expected import`
  * `component-model/instantiate/instantiate.wast` line 233: `` missing expected export `x` `` -> `missing expected export`
  * `component-model/instantiate/instantiate.wast` line 308: `expected global type i32, found i64` -> `type mismatch in global type`
  * `component-model/instantiate/instantiate.wast` line 316: `expected table element type funcref, found externref` -> `type mismatch in table element type`
  * `component-model/instantiate/instantiate.wast` line 365: `` type mismatch in export `g` `` -> `type mismatch in export`
  * `component-model/instantiate/instantiate.wast` line 436, 448: ``` duplicate module instantiation argument named `` ``` -> `duplicate module instantiation argument`
  * `component-model/instantiate/instantiate.wast` line 459: `expected global, found func` -> `expected global`
  * `component-model/instantiate/instantiate.wast` line 470: `` instantiation argument `a` conflicts with previous argument `a` `` -> `instantiation argument conflicts with previous argument`
  * `component-model/instantiate/instantiate.wast` line 525: `` export name `a` conflicts with previous name `a` `` -> `export name conflicts with previous name`
  * `component-model/instantiate/instantiate.wast` line 567: ``` export name `` already defined ``` -> `duplicate export name`
  * `component-model/instantiate/instantiate.wast` line 575: `` no export named `a` `` -> `unknown export`
  * `component-model/instantiate/instantiate.wast` line 613: ``` module instantiation argument `` does not export an item named `table` ``` -> `module instantiation argument unknown export`
  * `component-model/instantiate/instantiate.wast` line 642: `` expected primitive `u32` found primitive `string` `` -> `primitive mismatch`
  * `component-model/instantiate/instantiate.wast` line 691: `` expected parameter named `y`, found `x` `` -> `type mismatch in function parameter`
  * `component-model/instantiate/instantiate.wast` line 701: `` type mismatch in function parameter `x` `` -> `type mismatch in function parameter`
  * `component-model/instantiate/instantiate.wast` line 711: `type mismatch with result type` -> `type mismatch in result type`
  * `component-model/instantiate/instantiate.wast` line 722: `` type mismatch in instance export `a` `` -> `type mismatch in instance export`
  * `component-model/instantiate/instantiate.wast` line 734: `expected primitive, found record` -> `type mismatch`
  * `component-model/instantiate/instantiate.wast` line 746: `expected record, found u32` -> `type mismatch`
  * `component-model/instantiate/instantiate.wast` line 759: `expected u32, found tuple` -> `type mismatch`
  * `component-model/instantiate/instantiate.wast` line 772: `` type mismatch in record field `x` `` -> `type mismatch`
  * `component-model/instantiate/instantiate.wast` line 784: `expected 1 fields, found 2` -> `type mismatch`
  * `component-model/instantiate/instantiate.wast` line 796: `` expected field name `a`, found `b` `` -> `type mismatch in record field`
  * `component-model/instantiate/instantiate.wast` line 808: `expected 1 cases, found 2` -> `type mismatch`
  * `component-model/instantiate/instantiate.wast` line 820: `` expected case named `x`, found `y` `` -> `type mismatch in variant case`
  * `component-model/instantiate/instantiate.wast` line 832: `` expected case `x` to have a type, found none `` -> `type mismatch in variant case`
  * `component-model/instantiate/instantiate.wast` line 844: `` expected case `x` to have no type `` -> `type mismatch in variant case`
  * `component-model/instantiate/instantiate.wast` line 856: `` type mismatch in variant case `x` `` -> `type mismatch in variant case`
  * `component-model/instantiate/instantiate.wast` line 868: `expected 1 types, found 2` -> `type mismatch in tuple field`
  * `component-model/instantiate/instantiate.wast` line 880: `type mismatch in tuple field 0` -> `type mismatch in tuple field`
  * `component-model/instantiate/instantiate.wast` line 892: `mismatch in flags elements` -> `type mismatch in flags elements`
  * `component-model/instantiate/instantiate.wast` line 952: `expected ok type, but found none` -> `type mismatch in result type`
  * `component-model/instantiate/instantiate.wast` line 976: `expected err type, but found none` -> `type mismatch in result type`
  * `component-model/invalid/invalid.wast` line 22: `` outer count of `100` is too large `` -> `outer count is too large`
  * `component-model/invalid/invalid.wast` line 28: `` outer component `nonexistent` not found `` -> `outer component not found`
  * `component-model/invalid/invalid.wast` line 34: `` outer item `x` is not a module, type, or component `` -> `outer item is not a module, type, or component`
  * `component-model/naming/naming.wast` line 14: `` `1` is not in kebab case `` -> `not in kebab case`
  * `component-model/naming/naming.wast` line 22: `` instance 0 has no export named `Xml` `` -> `unknown export`
  * `component-model/naming/naming.wast` line 33: `` enum tag name `NevEr` is not in kebab case `` -> `not in kebab case`
  * `component-model/naming/naming.wast` line 40: `` record field name `GoNnA` is not in kebab case `` -> `not in kebab case`
  * `component-model/naming/naming.wast` line 47: `` variant case name `GIVe` is not in kebab case `` -> `not in kebab case`
  * `component-model/naming/naming.wast` line 55: `` function parameter name `yOu` is not in kebab case `` -> `not in kebab case`
  * `component-model/naming/naming.wast` line 62: `` `NevEr` is not in kebab case `` -> `not in kebab case`
  * `component-model/naming/naming.wast` line 69: `` `GonnA` is not in kebab case `` -> `not in kebab case`
  * `component-model/naming/naming.wast` line 76: `` `lET` is not in kebab case `` -> `not in kebab case`
  * `component-model/naming/naming.wast` line 83: `` `YoU` is not in kebab case `` -> `not in kebab case`
  * `component-model/naming/naming.wast` line 90: `` `DOWn` is not in kebab case `` -> `not in kebab case`
  * `component-model/naming/naming.wast` line 97: `` character `A` is not lowercase in package name/namespace `` -> `not lowercase in package name/namespace`
  * `component-model/naming/naming.wast` line 103: `` character `B` is not lowercase in package name/namespace `` -> `not lowercase in package name/namespace`
  * `component-model/naming/naming.wast` line 120: `` import name `[method]a.a` conflicts with previous name `a` `` -> `import name conflicts with previous name`
  * `component-model/naming/naming.wast` line 127: `` import name `[static]a.a` conflicts with previous name `a` `` -> `import name conflicts with previous name`
  * `component-model/resources/resources.wast` line 499: `expected resource, found defined type` -> `expected resource`
  * `component-model/resources/resources.wast` line 510: `expected defined type, found resource` -> `expected defined type`
  * `component-model/resources/resources.wast` line 750: `` missing import named `x` `` -> `missing import`
  * `component-model/resources/resources.wast` line 760: `` missing import named `y` `` -> `missing import`
  * `component-model/resources/resources.wast` line 849: `expected component, found instance` -> `expected component`
  * `component-model/resources/resources.wast` line 870: `` type mismatch for import `y` `` -> `type mismatch for import`
  * `component-model/resources/resources.wast` line 915: `` import name `[constructor]a` is not valid `` -> `import name is not valid`
  * `component-model/resources/resources.wast` line 920, 925, 1050: `` function does not match expected resource name `b` `` -> `function does not match expected resource name`
  * `component-model/tags/tags.wast` line 9: ``` export `` for core instance 0 is not a tag ``` -> `unknown tag`
  * `component-model/tags/tags.wast` line 30: `unknown tag 0` -> `unknown tag`
  * `component-model/types/types.wast` line 8, 49: `type index 0 is not a function type` -> `unknown function type`
  * `component-model/types/types.wast` line 15, 40: `core type index 0 is not a module type` -> `unknown module type`
  * `component-model/types/types.wast` line 22, 31: `type index 0 is not an instance type` -> `unknown instance type`
  * `component-model/types/types.wast` line 78: `` export name `a` already defined `` -> `duplicate export name`
  * `component-model/types/types.wast` line 112: `` export name `A` conflicts with previous name `a` `` -> `conflicts with previous export name`
  * `component-model/types/types.wast` line 121: `` import name `a` conflicts with previous name `A` `` -> `conflicts with previous import name`
  * `component-model/types/types.wast` line 165, 217: `invalid outer alias count of 100` -> `invalid outer alias count`
  * `component-model/types/types.wast` line 177, 229: ``` name `` already defined ``` -> `duplicate export name`
  * `component-model/types/types.wast` line 194: `` export name `FOO-bar-BAZ` conflicts with previous name `foo-BAR-baz` `` -> `conflicts with previous export name`
  * `component-model/types/types.wast` line 368: `type index 0 is a module type` -> `unknown module type`
