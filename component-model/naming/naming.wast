;; RUN: wast --assert default --snapshot tests/snapshots %

(component definition
  (func (import "a"))
  (component)
  (instance (instantiate 0 (with "NotKebab-Case" (func 0))))
)

(assert_invalid
  (component
    (import "f" (func))
    (instance (export "1" (func 0)))
  )
  "not in kebab case"
)

(assert_invalid
  (component
    (instance)
    (alias export 0 "Xml" (func))
  )
  "unknown export"
)

(component definition
  (type (flags "a-1-c"))
)

(assert_invalid
  (component
    (type (enum "NevEr"))
  )
  "not in kebab case"
)

(assert_invalid
  (component
    (type (record (field "GoNnA" string)))
  )
  "not in kebab case"
)

(assert_invalid
  (component
    (type (variant (case "GIVe" string)))
  )
  "not in kebab case"
)


(assert_invalid
  (component
    (type (func (param "yOu" string)))
  )
  "not in kebab case"
)

(assert_invalid
  (component
    (type (component (export "NevEr" (func))))
  )
  "not in kebab case"
)

(assert_invalid
  (component
    (type (component (import "GonnA" (func))))
  )
  "not in kebab case"
)

(assert_invalid
  (component
    (type (instance (export "lET" (func))))
  )
  "not in kebab case"
)

(assert_invalid
  (component
    (instance (export "YoU"))
  )
  "not in kebab case"
)

(assert_invalid
  (component
    (instance (import "DOWn"))
  )
  "not in kebab case"
)

(assert_invalid
  (component
    (instance (import "A:b/c"))
  )
  "not lowercase in package name/namespace"
)
(assert_invalid
  (component
    (instance (import "a:B/c"))
  )
  "not lowercase in package name/namespace"
)
(component
  (instance (import "a:b/c"))
  (instance (import "a1:b1/c"))
)

(component definition
  (import "a" (type $a (sub resource)))
  (import "[constructor]a" (func (result (own $a))))
)

(assert_invalid
  (component
    (import "a" (type $a (sub resource)))
    (import "[method]a.a" (func (param "self" (borrow $a))))
  )
  "import name conflicts with previous name")

(assert_invalid
  (component
    (import "a" (type $a (sub resource)))
    (import "[static]a.a" (func))
  )
  "import name conflicts with previous name")
