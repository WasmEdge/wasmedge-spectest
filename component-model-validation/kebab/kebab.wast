(component (component
  (import "a" (func))
  (import "a1" (func))
  (import "a-1" (func))
  (import "a-1-b-2-c-3" (func))
  (import "B" (func))
  (import "B1" (func))
  (import "B-1" (func))
  (import "B-1-C-2-D-3" (func))
  (import "a11-B11-123-ABC-abc" (func))
  (import "ns-1-a:b-1-c/D-2" (func))
))
(assert_invalid
  (component
    (import "1" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "1-a" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "a-" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "a--" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "1:a/b" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "A:b/c" (func)))
  "not lowercase in package name/namespace")
(assert_invalid
  (component
    (import "1:b/c" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "ns-A:b/c" (func)))
  "not lowercase in package name/namespace")
(assert_invalid
  (component
    (import "ns:A/b" (func)))
  "not lowercase in package name/namespace")
(assert_invalid
  (component
    (import "ns:1/a" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "ns:pkg-A/b" (func)))
  "not lowercase in package name/namespace")
