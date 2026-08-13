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
* `component-model-` prefixed folders: The tests for the [Component Model](https://github.com/WebAssembly/component-model) proposal, mirroring the folders under the [`test`](https://github.com/WebAssembly/component-model/tree/main/test) directory of the spec repository:
  * `component-model-async`: The tests from `test/async`.
  * `component-model-binary`: The tests from `test/binary`.
  * `component-model-linking`: The tests from `test/linking`.
  * `component-model-resources`: The tests from `test/resources`.
  * `component-model-validation`: The tests from `test/validation`.
  * `component-model-values`: The tests from `test/values`.
  * The former `component-model-wasm-tools` and `component-model-wasmtime` folders are gone: upstream folded `test/wasm-tools` and `test/wasmtime` into the rest of the test suite, and their cases now live in `binary`, `linking`, `resources`, `validation`, and `values`.
  * Three of these tests are listed in the spec repository's own `test/nyi.txt` as not implemented by any engine yet, and WasmEdge does not pass them either: `component-model-async/during-sync-call-may-block-if-other-ready-threads`, `component-model-async/during-sync-call-no-exclusive-resume`, and `component-model-async/during-sync-call-no-sibling-resume`. They require a spawned thread to stay suspended across two separate host calls into the component.

## Tags

### Active Tags

* `wasm-core-20260813`: Split the component-model tests into one folder per upstream test directory and align their expected messages with WasmEdge's diagnostics

### Older Tags

* `wasm-core-20260728`: Update test suite to 2026/07/28, add the return call result subtyping and the invalid abstract subtyping tests, and move the `instance` tests back to `wasm-3.0`
* `wasm-core-20260708`: Improve test coverage around `data.drop` and `elem.drop`, and add the transitive equivalent subtyping test
* `wasm-core-20260421`: Add tests for segment single-evaluation in `table.init`, `array.init_elem`, and `array.new_elem`
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

The component-model test data is converted from the `.wast` files in the [`test`](https://github.com/WebAssembly/component-model/tree/main/test) directory of the spec repository (commit `8b5c200`) with the `json-from-wast` command of [wasm-tools](https://github.com/bytecodealliance/wasm-tools) (1.256.0). The `.wast` files are copied from the spec repository and modified as described below; the `.json` and `.wasm` files are generated from the modified `.wast` files.

Note: the `(component definition ...)` and `(component instance ...)` commands are converted into the `"module_definition"` and `"module_instance"` command types described above, and `assert_trap` on component instantiation is converted into `"assert_uninstantiable"`.

Component-level values in the `"args"` and `"expected"` fields use the WIT type names, for example:

* `{"type": "u32", "value": "42"}`, `{"type": "bool", "value": true}`, `{"type": "char", "value": "Z"}`, `{"type": "string", "value": "hi"}`
* `{"type": "list", "value": [...]}`, `{"type": "tuple", "value": [...]}` with nested values
* `{"type": "record", "value": [["field-name", {...}], ...]}`
* `{"type": "variant", "value": {"case": "s", "payload": {...}}}`
* `{"type": "enum", "value": "red"}`, `{"type": "flags", "value": ["a", "c"]}`
* `{"type": "option", "value": {...}}` (or `null` for `none`), `{"type": "result", "value": {"Ok": {...}}}` (or `{"Err": {...}}`)

#### Removed Test Cases

* `test/wasm-tools/wrong-order.wast`: while this file still existed upstream it was left out, because it is a core WASM section-order test whose expected message in the spec repository does not match the one the WASM spec prescribes. Upstream has since removed the file; the equivalent case now lives in `component-model-binary/binary/binary.wast` line 200 and is kept, with the WASM-spec message.

#### Component-Model Trap Message Changes

The expected error messages are adjusted to WasmEdge's diagnostic vocabulary (<https://github.com/WasmEdge/WasmEdge/pull/4666>). In general, the variable parts of the spec messages are removed, because WasmEdge reports fixed error strings without interpolated values:

* Concrete names and indices, e.g. `` unknown instance: failed to find name `$i` `` -> `unknown instance`.
* The `found ...` details in `expected X, found Y` messages, e.g. `expected func, found component` -> `expected func`.
* Some messages are replaced with the corresponding WasmEdge error string entirely, e.g. `expected 0 parameters, found 1` -> `type mismatch in function type`.

WasmEdge matches an expected message by prefix: the `text` of the assertion has to *start with* the error string WasmEdge reports. An expected message therefore keeps only the leading, variable-free part of the reference diagnostic, and it keeps every word of the WasmEdge error string even where the reference message reads differently:

* A variable in the middle of the reference message forces the whole sentence to be rewritten without it, e.g. `` import name `a` conflicts with previous name `a` `` -> `` import name conflicts with previous name ``.
* A reference message that only continues after the WasmEdge error string keeps that tail, e.g. `` handle index 1 used with the wrong type, expected guest-defined resource but found a different guest-defined resource `` -> `` used with the wrong type, expected guest-defined resource but found a different guest-defined resource ``.
* The `wasm trap: ` prefix that wasmtime puts in front of runtime traps is dropped, because WasmEdge reports the trap reason on its own.
* `component-model-binary/binary/binary.wast` leaves the expected text of many `assert_malformed` cases empty, which means "any decoding error" for the reference tools. Prefix matching cannot accept an empty text, so each of them is filled in with the message WasmEdge reports.
* Where the reference tool names the offending byte, e.g. `` invalid leading byte (0x44) for component defined type ``, WasmEdge reports a fixed `` malformed ... `` string for the same grammar position, so the whole message is replaced.

The reference messages below are the ones reported by `wasm-tools validate --features all` (1.256.0) for the loading and validation assertions, and by `wasmtime wast` (46.0.0) for the link-time and runtime assertions.

The full list of changes:

* `component-model-async/builtin-trap-poisons-instance/builtin-trap-poisons-instance.wast` line 9: `` wasm trap: wasm `unreachable` instruction executed `` -> `` unreachable ``
* `component-model-async/deadlock/deadlock.wast` line 73: `` wasm trap: deadlock detected: event loop cannot make further progress `` -> `` deadlock detected: event loop cannot make further progress ``
* `component-model-async/trap-on-reenter/trap-on-reenter.wast` line 65, 86, 110: `` wasm trap: cannot enter component instance `` -> `` cannot enter component instance ``
* `component-model-binary/binary/binary.wast` line 17, 18, 19, 20: `` `` (empty) -> `` magic header not detected ``
* `component-model-binary/binary/binary.wast` line 10, 11, 12, 13, 14, 15, 16: `` `` (empty) -> `` unexpected end ``
* `component-model-binary/binary/binary.wast` line 21, 22, 23, 24, 25, 26: `` `` (empty) -> `` unknown binary version ``
* `component-model-binary/binary/binary.wast` line 521: ``` `core instance 0 has no export named `f`` ``` -> `` unknown export ``
* `component-model-binary/binary/binary.wast` line 1530: `` expected a version header for a component `` -> `` unknown binary version ``
* `component-model-binary/binary/binary.wast` line 217: `` expected a version header for a module `` -> `` unknown binary version ``
* `component-model-binary/binary/binary.wast` line 506: ``` `instance 0 has no export named `t`` ``` -> `` unknown export ``
* `component-model-binary/binary/binary.wast` line 1161, 1170: `` invalid boolean value `` -> `` malformed canonical ``
* `component-model-binary/binary/binary.wast` line 943: `` invalid leading byte `` -> `` invalid type reference ``
* `component-model-binary/binary/binary.wast` line 1314: `` invalid leading byte (0x0) for component external kind `` -> `` integer representation too long ``
* `component-model-binary/binary/binary.wast` line 296: `` invalid leading byte (0x0) for instantiation arg kind `` -> `` malformed core instance ``
* `component-model-binary/binary/binary.wast` line 921: `` invalid leading byte (0x0) for outer alias kind `` -> `` malformed sort ``
* `component-model-binary/binary/binary.wast` line 931: `` invalid leading byte (0x0) for outer alias target `` -> `` malformed alias target ``
* `component-model-binary/binary/binary.wast` line 1124: `` invalid leading byte (0x1) for canonical function lift `` -> `` malformed canonical ``
* `component-model-binary/binary/binary.wast` line 1133: `` invalid leading byte (0x1) for canonical function lower `` -> `` malformed canonical ``
* `component-model-binary/binary/binary.wast` line 480: `` invalid leading byte (0x1) for component outer alias kind `` -> `` malformed sort ``
* `component-model-binary/binary/binary.wast` line 762: `` invalid leading byte (0x1) for number of results `` -> `` malformed defined type ``
* `component-model-binary/binary/binary.wast` line 622: `` invalid leading byte (0x1) for zero byte required `` -> `` malformed variant type ``
* `component-model-binary/binary/binary.wast` line 458: `` invalid leading byte (0x13) for component outer alias kind `` -> `` malformed sort ``
* `component-model-binary/binary/binary.wast` line 772: `` invalid leading byte (0x2) for component function results `` -> `` malformed defined type ``
* `component-model-binary/binary/binary.wast` line 278: `` invalid leading byte (0x2) for core instance `` -> `` malformed core instance ``
* `component-model-binary/binary/binary.wast` line 343: `` invalid leading byte (0x2) for instance `` -> `` malformed instance ``
* `component-model-binary/binary/binary.wast` line 1463: `` invalid leading byte (0x2) for optional component export type `` -> `` malformed defined type ``
* `component-model-binary/binary/binary.wast` line 1292: `` invalid leading byte (0x2) for type bound `` -> `` invalid wasm grammar ``
* `component-model-binary/binary/binary.wast` line 1105: `` invalid leading byte (0x2e) for canonical function `` -> `` malformed canonical ``
* `component-model-binary/binary/binary.wast` line 431: `` invalid leading byte (0x3) for alias `` -> `` malformed alias target ``
* `component-model-binary/binary/binary.wast` line 1267: `` invalid leading byte (0x3) for component name `` -> `` malformed name ``
* `component-model-binary/binary/binary.wast` line 863: `` invalid leading byte (0x3) for component or instance type declaration `` -> `` malformed defined type ``
* `component-model-binary/binary/binary.wast` line 1281: `` invalid leading byte (0x3) for name option `` -> `` malformed name ``
* `component-model-binary/binary/binary.wast` line 609: `` invalid leading byte (0x3e) for component defined type `` -> `` malformed defined type ``
* `component-model-binary/binary/binary.wast` line 911: `` invalid leading byte (0x4) for type definition `` -> `` invalid wasm grammar ``
* `component-model-binary/binary/binary.wast` line 1114: `` invalid leading byte (0x43) for canonical function `` -> `` malformed canonical ``
* `component-model-binary/binary/binary.wast` line 600: `` invalid leading byte (0x44) for component defined type `` -> `` malformed defined type ``
* `component-model-binary/binary/binary.wast` line 851: `` invalid leading byte (0x5) for component or instance type declaration `` -> `` malformed defined type ``
* `component-model-binary/binary/binary.wast` line 449, 471: `` invalid leading byte (0x5) for component outer alias kind `` -> `` malformed sort ``
* `component-model-binary/binary/binary.wast` line 1303: `` invalid leading byte (0x6) for component external kind `` -> `` invalid wasm grammar ``
* `component-model-binary/binary/binary.wast` line 1496: `` invalid leading byte (0x6) for component external kind `` -> `` malformed sort ``
* `component-model-binary/binary/binary.wast` line 440: `` invalid leading byte (0x6) for component outer alias kind `` -> `` malformed sort ``
* `component-model-binary/binary/binary.wast` line 591: `` invalid leading byte (0x62) for component defined type `` -> `` malformed defined type ``
* `component-model-binary/binary/binary.wast` line 1096: `` invalid leading byte (0x7) for canonical function `` -> `` malformed canonical ``
* `component-model-binary/binary/binary.wast` line 1151: `` invalid leading byte (0xa) for canonical option `` -> `` unknown canonical option ``
* `component-model-binary/binary/binary.wast` line 1351, 1365: `` is not a valid extern name `` -> `` not in kebab case ``
* `component-model-binary/binary/binary.wast` line 738: `` is not valid at this time `` -> ``` ``stream<char>` is not valid at this time` ```
* `component-model-binary/binary/binary.wast` line 208: `` section out of order `` -> `` unexpected content after last section ``
* `component-model-binary/binary/binary.wast` line 729: `` type index 0 is not a resource type `` -> `` not a resource type ``
* `component-model-binary/binary/binary.wast` line 165: `` unexpected end-of-file `` -> `` integer representation too long ``
* `component-model-binary/binary/binary.wast` line 50, 90, 1325: `` unexpected end-of-file `` -> `` length out of bounds ``
* `component-model-binary/binary/binary.wast` line 97: `` unexpected end-of-file `` -> `` section size mismatch ``
* `component-model-linking/tags/tags.wast` line 142: `` export `f` for core instance 0 is not a tag `` -> `` unknown tag ``
* `component-model-resources/handle-table/handle-table.wast` line 322, 324: `` handle index 1 used with the wrong type, expected guest-defined resource but found a different guest-defined resource `` -> `` used with the wrong type, expected guest-defined resource but found a different guest-defined resource ``
* `component-model-validation/abi/abi.wast` line 163: ``` ``memory` is specified more than once` ``` -> `` canonical option `memory` is specified more than once ``
* `component-model-validation/abi/abi.wast` line 150: ``` `canonical encoding option `utf16` conflicts with option `latin1-utf16`` ``` -> `` canonical encoding option conflicts ``
* `component-model-validation/abi/abi.wast` line 144: ``` `canonical encoding option `utf8` conflicts with option `latin1-utf16`` ``` -> `` canonical encoding option conflicts ``
* `component-model-validation/abi/abi.wast` line 138: ``` `canonical encoding option `utf8` conflicts with option `utf16`` ``` -> `` canonical encoding option conflicts ``
* `component-model-validation/abi/abi.wast` line 20: `` canonical option `realloc` requires `memory` to also be specified `` -> `` canonical option `memory` is required ``
* `component-model-validation/abi/abi.wast` line 256: ``` `lowered parameter types `[]` do not match parameter types `[I32]`` ``` -> `` lowered parameter types do not match parameter types ``
* `component-model-validation/abi/abi.wast` line 263: ``` `lowered result types `[]` do not match result types `[I32]`` ``` -> `` lowered result types do not match result types ``
* `component-model-validation/annotated-names/annotated-names.wast` line 96: `` does not match expected resource name `` -> `` function does not match expected resource name ``
* `component-model-validation/annotated-names/annotated-names.wast` line 33, 175: ``` `function does not match expected resource name `b`` ``` -> `` function does not match expected resource name ``
* `component-model-validation/annotated-names/annotated-names.wast` line 197: ``` `import name `[method]a.a` conflicts with previous name `a`` ``` -> `` import name conflicts with previous name ``
* `component-model-validation/annotated-names/annotated-names.wast` line 202: ``` `import name `[static]a.a` conflicts with previous name `a`` ``` -> `` import name conflicts with previous name ``
* `component-model-validation/annotated-names/annotated-names.wast` line 28: ``` `should return `(own $T)`` ``` -> ``` `function should return `(own $T)` or `(result (own $T))`` ```
* `component-model-validation/attributes/attributes.wast` line 111, 117, 123, 129, 135, 141: `` conflicts with previous name `` -> `` import name conflicts with previous name ``
* `component-model-validation/attributes/attributes.wast` line 234, 243: ``` `missing import named `primary`` ``` -> `` missing import ``
* `component-model-validation/attributes/attributes.wast` line 153, 183: ``` `name `a1:b/c` is not valid with `implements`` ``` -> ``` `is not valid with `implements`` ```
* `component-model-validation/attributes/attributes.wast` line 103, 162: `` not a valid name `` -> ``` ``implements` name is not a valid name` ```
* `component-model-validation/attributes/attributes.wast` line 165: `` only instances `` -> ``` `only instances can have an `implements`` ```
* `component-model-validation/core-modules/core-modules.wast` line 93, 109: ``` `duplicate import name `:`` ``` -> `` duplicate import name ``
* `component-model-validation/core-modules/core-modules.wast` line 101, 117: ``` `duplicate import name `:a`` ``` -> `` duplicate import name ``
* `component-model-validation/core-modules/core-modules.wast` line 50: `` export name `a` already defined `` -> `` duplicate export name ``
* `component-model-validation/core-modules/core-modules.wast` line 71, 81: `` name `` already defined `` -> `` duplicate export name ``
* `component-model-validation/defined-types/defined-types.wast` line 250: `` core type index 0 is not a module type `` -> `` not a module type ``
* `component-model-validation/defined-types/defined-types.wast` line 238, 244: `` core type index 0 is not a module type `` -> `` unknown module type ``
* `component-model-validation/defined-types/defined-types.wast` line 72: `` enum tag name `NevEr` is not in kebab case `` -> `` not in kebab case ``
* `component-model-validation/defined-types/defined-types.wast` line 63: ``` `enum tag name `X` conflicts with previous tag name `x`` ``` -> `` enum tag name conflicts with previous tag name ``
* `component-model-validation/defined-types/defined-types.wast` line 60: ``` `flag name `X` conflicts with previous flag name `x`` ``` -> `` flag name conflicts with previous flag name ``
* `component-model-validation/defined-types/defined-types.wast` line 66: ``` `function parameter name `FOO` conflicts with previous parameter name `foo`` ``` -> `` function parameter name conflicts with previous parameter name ``
* `component-model-validation/defined-types/defined-types.wast` line 81: `` function parameter name `yOu` is not in kebab case `` -> `` not in kebab case ``
* `component-model-validation/defined-types/defined-types.wast` line 51: ``` `record field name `A-b-C-d` conflicts with previous field name `a-B-c-D`` ``` -> `` record field name conflicts with previous field name ``
* `component-model-validation/defined-types/defined-types.wast` line 75: `` record field name `GoNnA` is not in kebab case `` -> `` not in kebab case ``
* `component-model-validation/defined-types/defined-types.wast` line 125, 130, 135: `` type index 0 is not a defined type `` -> `` not a defined type ``
* `component-model-validation/defined-types/defined-types.wast` line 191, 203, 210: `` type index 0 is not a function type `` -> `` not a function type ``
* `component-model-validation/defined-types/defined-types.wast` line 183, 197: `` type index 0 is not a function type `` -> `` unknown function type ``
* `component-model-validation/defined-types/defined-types.wast` line 230: `` type index 0 is not an instance type `` -> `` not an instance type ``
* `component-model-validation/defined-types/defined-types.wast` line 218, 224: `` type index 0 is not an instance type `` -> `` unknown instance type ``
* `component-model-validation/defined-types/defined-types.wast` line 78: `` variant case name `GIVe` is not in kebab case `` -> `` not in kebab case ``
* `component-model-validation/defined-types/defined-types.wast` line 57: ``` `variant case name `X` conflicts with previous case name `x`` ``` -> `` variant case name conflicts with previous case name ``
* `component-model-validation/defined-types/defined-types.wast` line 54: ``` `variant case name `x` conflicts with previous case name `x`` ``` -> `` variant case name conflicts with previous case name ``
* `component-model-validation/extern-names/extern-names.wast` line 22: `` conflicts with previous name `` -> `` import name conflicts with previous name ``
* `component-model-validation/extern-names/extern-names.wast` line 58: ``` `trailing characters found: `/qux`` ``` -> `` trailing characters found ``
* `component-model-validation/extern-names/extern-names.wast` line 31: `` unexpected character '.' `` -> `` unexpected character ``
* `component-model-validation/extern-names/extern-names.wast` line 37: `` unexpected character 'a' `` -> `` unexpected character ``
* `component-model-validation/extern-names/extern-names.wast` line 40: `` unexpected character 'b' `` -> `` unexpected character ``
* `component-model-validation/extern-names/extern-names.wast` line 43: `` unexpected character 'x' `` -> `` unexpected character ``
* `component-model-validation/external-visibility/external-visibility.wast` line 605: ``` `missing expected export `f`` ``` -> `` missing expected export ``
* `component-model-validation/instantiation/instantiation.wast` line 642: ``` `core instance 0 has no export named `a`` ``` -> `` unknown export ``
* `component-model-validation/instantiation/instantiation.wast` line 465: ``` `does not export an item named `table`` ``` -> `` unknown export ``
* `component-model-validation/instantiation/instantiation.wast` line 235: `` expected 0 parameters, found 1 `` -> `` type mismatch in function type ``
* `component-model-validation/instantiation/instantiation.wast` line 86: `` expected 1 cases, found 2 `` -> `` type mismatch ``
* `component-model-validation/instantiation/instantiation.wast` line 68: `` expected 1 fields, found 2 `` -> `` type mismatch ``
* `component-model-validation/instantiation/instantiation.wast` line 131: `` expected 1 types, found 2 `` -> `` type mismatch in tuple field ``
* `component-model-validation/instantiation/instantiation.wast` line 228: `` expected a result, found none `` -> `` expected a result ``
* `component-model-validation/instantiation/instantiation.wast` line 104: `` expected case `x` to have a type, found none `` -> `` type mismatch in variant case ``
* `component-model-validation/instantiation/instantiation.wast` line 113: `` expected case `x` to have no type `` -> `` type mismatch in variant case ``
* `component-model-validation/instantiation/instantiation.wast` line 95: ``` `expected case named `x`, found `y`` ``` -> `` type mismatch in variant case ``
* `component-model-validation/instantiation/instantiation.wast` line 496: `` expected component, found instance `` -> `` expected component ``
* `component-model-validation/instantiation/instantiation.wast` line 212: `` expected err type, but found none `` -> `` type mismatch in result type ``
* `component-model-validation/instantiation/instantiation.wast` line 77: ``` `expected field name `a`, found `b`` ``` -> `` type mismatch in record field ``
* `component-model-validation/instantiation/instantiation.wast` line 488: `` expected func, found component `` -> `` expected func ``
* `component-model-validation/instantiation/instantiation.wast` line 387: `` expected global type i32, found i64 `` -> `` type mismatch in global type ``
* `component-model-validation/instantiation/instantiation.wast` line 443: `` expected global, found func `` -> `` expected global ``
* `component-model-validation/instantiation/instantiation.wast` line 194: `` expected ok type, but found none `` -> `` type mismatch in result type ``
* `component-model-validation/instantiation/instantiation.wast` line 242: ``` `expected parameter named `y`, found `x`` ``` -> `` type mismatch in function parameter ``
* `component-model-validation/instantiation/instantiation.wast` line 21: ``` `expected primitive `u32` found primitive `string`` ``` -> `` primitive mismatch ``
* `component-model-validation/instantiation/instantiation.wast` line 30: `` expected primitive, found record `` -> `` type mismatch ``
* `component-model-validation/instantiation/instantiation.wast` line 39: `` expected record, found u32 `` -> `` type mismatch ``
* `component-model-validation/instantiation/instantiation.wast` line 395: `` expected table element type funcref, found externref `` -> `` type mismatch in table element type ``
* `component-model-validation/instantiation/instantiation.wast` line 49: `` expected u32, found tuple `` -> `` type mismatch ``
* `component-model-validation/instantiation/instantiation.wast` line 536: `` export name `a` already defined `` -> `` duplicate export name ``
* `component-model-validation/instantiation/instantiation.wast` line 527: ``` `export name `a` conflicts with previous name `a`` ``` -> `` export name conflicts with previous name ``
* `component-model-validation/instantiation/instantiation.wast` line 561: `` index out of bounds `` -> `` function index out of bounds ``
* `component-model-validation/instantiation/instantiation.wast` line 635: ``` `instance 0 has no export named `Xml`` ``` -> `` unknown export ``
* `component-model-validation/instantiation/instantiation.wast` line 649: ``` `instance 0 has no export named `a`` ``` -> `` unknown export ``
* `component-model-validation/instantiation/instantiation.wast` line 516: ``` `instantiation argument `a` conflicts with previous argument `a`` ``` -> `` instantiation argument conflicts with previous argument ``
* `component-model-validation/instantiation/instantiation.wast` line 657, 666: `` is not a module `` -> `` export is not a module ``
* `component-model-validation/instantiation/instantiation.wast` line 149: `` mismatch in flags elements `` -> `` type mismatch in flags elements ``
* `component-model-validation/instantiation/instantiation.wast` line 319: ``` `missing expected export `x`` ``` -> `` missing expected export ``
* `component-model-validation/instantiation/instantiation.wast` line 624: ``` `no export named `a`` ``` -> `` unknown export ``
* `component-model-validation/instantiation/instantiation.wast` line 327: ``` `type mismatch in export `g`` ``` -> `` type mismatch in export ``
* `component-model-validation/instantiation/instantiation.wast` line 249: ``` `type mismatch in function parameter `x`` ``` -> `` type mismatch in function parameter ``
* `component-model-validation/instantiation/instantiation.wast` line 274: ``` `type mismatch in instance export `a`` ``` -> `` type mismatch in instance export ``
* `component-model-validation/instantiation/instantiation.wast` line 59: ``` `type mismatch in record field `x`` ``` -> `` type mismatch ``
* `component-model-validation/instantiation/instantiation.wast` line 140: `` type mismatch in tuple field 0 `` -> `` type mismatch in tuple field ``
* `component-model-validation/instantiation/instantiation.wast` line 122: ``` `type mismatch in variant case `x`` ``` -> `` type mismatch in variant case ``
* `component-model-validation/instantiation/instantiation.wast` line 256: `` type mismatch with result type `` -> `` type mismatch in result type ``
* `component-model-validation/kebab/kebab.wast` line 102: ``` ``1` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 118: ``` ``DOWn` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 106: ``` ``GonnA` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 55: ``` ``HtTp` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 110: ``` ``NevEr` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 47: ``` ``TyPeS` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 51: ``` ``WaSi` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 63, 67, 71: ``` ``` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 39: ``` ``aBc` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 114: ``` ``lET` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 59: ``` ``wasi/http` is not in kebab case` ``` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 144: ``` `export name `A` conflicts with previous name `a`` ``` -> `` conflicts with previous export name ``
* `component-model-validation/kebab/kebab.wast` line 132: ``` `export name `A` conflicts with previous name `a`` ``` -> `` export name conflicts with previous name ``
* `component-model-validation/kebab/kebab.wast` line 150: ``` `export name `FOO-bar-BAZ` conflicts with previous name `foo-BAR-baz`` ``` -> `` conflicts with previous export name ``
* `component-model-validation/kebab/kebab.wast` line 126: ``` `export name `a` conflicts with previous name `a`` ``` -> `` export name conflicts with previous name ``
* `component-model-validation/kebab/kebab.wast` line 138: ``` `import name `a` conflicts with previous name `A`` ``` -> `` conflicts with previous import name ``
* `component-model-validation/kebab/kebab.wast` line 79, 91: `` is not a valid extern name `` -> `` not in kebab case ``
* `component-model-validation/kebab/kebab.wast` line 75, 83, 87, 95: `` is not a valid extern name `` -> `` not lowercase in package name/namespace ``
* `component-model-validation/kebab/kebab.wast` line 19, 23, 27, 31, 35, 43: `` is not in kebab case `` -> `` not in kebab case ``
* `component-model-validation/outer-alias/outer-alias.wast` line 210, 217, 235, 245: `` index out of bounds `` -> `` type index out of bounds ``
* `component-model-validation/outer-alias/outer-alias.wast` line 180, 187, 194, 201: `` may only refer to types or instances `` -> `` invalid type reference ``
* `component-model-validation/outer-alias/outer-alias.wast` line 285: `` outer item `x` is not a module, type, or component `` -> `` outer item is not a module, type, or component ``
* `component-model-validation/outer-alias/outer-alias.wast` line 44, 52, 60, 67, 76, 87, 95: `` transitively refers to resources `` -> `` refers to resources not defined in the current component ``
* `component-model-validation/resources/resources.wast` line 666: `` expected defined type, found resource `` -> `` expected defined type ``
* `component-model-validation/resources/resources.wast` line 110, 190: `` expected own, found borrow `` -> `` expected own ``
* `component-model-validation/resources/resources.wast` line 657: `` expected resource, found defined type `` -> `` expected resource ``
* `component-model-validation/resources/resources.wast` line 673: ``` `missing import named `x`` ``` -> `` missing import ``
* `component-model-values/realloc/realloc.wast` line 124: `` realloc return: result not aligned `` -> `` unaligned pointer ``
* `component-model-values/realloc/realloc.wast` line 67: `` wasm trap: list content out-of-bounds `` -> `` realloc return: beyond end of memory ``
* `component-model-values/realloc/realloc.wast` line 94: `` wasm trap: unaligned pointer `` -> `` unaligned pointer ``
