;; RUN: wast --assert default --snapshot tests/snapshots %

(assert_invalid
  (component
    (core type (module
      (import "" "" (func (type 1)))
    ))
    (type (func))
  )
  "type index out of bounds")

(assert_malformed
  (component quote
    "(export \"\" (func $foo))"
  )
  "unknown func")

(assert_malformed
  (component quote
    "(alias outer 100 $foo (type $foo))"
  )
  "outer count is too large")

(assert_malformed
  (component quote
    "(alias outer $nonexistent $foo (type $foo))"
  )
  "outer component not found")

(assert_malformed
  (component quote
    "(import \"x\" (func $x))"
    "(component (export \"x\" (func $x)))")
  "outer item is not a module, type, or component")
