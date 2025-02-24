# Introduction

**WasmEdge-spectest** is a repository of spec test data by extracting WebAssembly (WASM) test suites.

* Test data is from [WebAssembly Core Tests](https://github.com/WebAssembly/spec/tree/master/test/core) and tests from every proposals.

* [S-Expression script](https://github.com/WebAssembly/spec/blob/master/interpreter/README.md#s-expression-syntax) of tests are extracted into `json` and `wasm` files by [wast2json](https://webassembly.github.io/wabt/doc/wast2json.1.html) tool in [wabt](https://github.com/WebAssembly/wabt).
code.

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
* `exception-handling`: The tests of the [Exception handling](https://github.com/WebAssembly/exception-handling) proposal.
* `exception-handling-legacy`: The legacy version tests of the [Exception handling](https://github.com/WebAssembly/exception-handling) proposal.
* `extended-const`: The tests of the [Extended Constant Expressions](https://github.com/WebAssembly/extended-const) proposal.
* `function-references`: The tests of the [Typed Function References](https://github.com/WebAssembly/function-references) proposal.
* `gc`: The tests of the [Garbage collection](https://github.com/WebAssembly/gc) proposal.
* `memory64`: The tests of the [Memory64](https://github.com/WebAssembly/memory64) proposal.
* `multi-memory`: The tests of the [Multiple memories](https://github.com/WebAssembly/multi-memory) proposal.
* `relaxed-simd`: The tests of the [Relaxed SIMD](https://github.com/WebAssembly/relaxed-simd) proposal.
* `tail-call`: The tests of the [Tail call](https://github.com/WebAssembly/tail-call) proposal.
* `threads`: The tests of the [Threads](https://github.com/webassembly/threads) proposal.

## Whats Difference

* `wasm-2.0/select/select.wast` line 325: `invalid result arity` -> `type mismatch`
  * This error message is for the WAT format, WASM format cannot detect this error by the bytecode.
* `threads/atomic/atomic.wast`: divergence behavior
  * Please check [this issue](https://github.com/WebAssembly/threads/issues/195).
  * Modified the `wast` file for fitting the `compare_exchange_strong` behavior in C++.
* `threads/atomic_wait_notify/atomic_wait_notify.wast`: line 73: remove the thread tests.
  * The S-Expression of threads cannot be parsed by wabt, therefore remove them.
* `function-references/select/select.wast` line 369: `invalid result arity` -> `type mismatch`
  * This error message is for the WAT format, WASM format cannot detect this error by the byte

## Tags

### Active Tags

* `wasm-core-20250217`: The test suite in the date 2025/02/17 from the WASM spec and proposals.

### Older Tags

* This repo is moved from the old spec test repo. For older tags and history, please refer to the [WasmEdge-unittest repo](https://github.com/second-state/WasmEdge-unittest).
  * `wasm-core-20240217`: The test suite in the date 2024/02/17 from the WASM spec.
  * `wasm-core-20231026`: The test suite in the date 2023/10/26 from the WASM spec.
  * `wasm-core-20230511`: The test suite in the date 2023/05/11 from the WASM spec.
  * `wasm-core-20221215`: The test suite in the date 2022/12/15 from the WASM spec.
  * `wasm-core-20221026`: The test suite in the date 2022/10/26 from the WASM spec.
  * `wasm-core-20220712`: The test suite in the date 2022/07/12 from the WASM spec.
  * `wasm-core-20220504`: The test suite in the date 2022/05/04 from the WASM spec.
  * `wasm-core-20220223`: The test suite in the date 2022/02/23 from the WASM spec.
  * `wasm-core-20211214`: The test suite in the date 2021/12/14 from the WASM spec.
  * `wasm-core-20211119`: The test suite in the date 2021/11/19 from the WASM spec.
  * `wasm-core-20210414`: The test suite in the date 2021/04/14 from the WASM spec.
