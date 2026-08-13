;; Validation of kebab-case plain names and `ns:pkg/iface` extern names, and
;; case-insensitive uniqueness of import/export names.

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
    (import "aBc" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "1:a/b" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "wasi:http/TyPeS" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "WaSi:http/types" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "wasi:HtTp/types" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "wasi/http" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "wasi:" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import "wasi:/" (func)))
  "not in kebab case")
(assert_invalid
  (component
    (import ":/" (func)))
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

;; names are validated in non-import positions too
(assert_invalid
  (component
    (import "f" (func $f))
    (instance (export "1" (func $f))))
  "not in kebab case")
(assert_invalid
  (component
    (type (component (import "GonnA" (func)))))
  "not in kebab case")
(assert_invalid
  (component
    (type (component (export "NevEr" (func)))))
  "not in kebab case")
(assert_invalid
  (component
    (type (instance (export "lET" (func)))))
  "not in kebab case")
(assert_invalid
  (component
    (import "DOWn" (instance)))
  "not in kebab case")

;; import/export names must be unique, compared case-insensitively
(assert_invalid
  (component
    (import "f" (func $f))
    (export "a" (func $f))
    (export "a" (func $f)))
  "export name conflicts with previous name")
(assert_invalid
  (component
    (import "f" (func $f))
    (export "a" (func $f))
    (export "A" (func $f)))
  "export name conflicts with previous name")
(assert_invalid
  (component
    (type (component
      (import "A" (func))
      (import "a" (func)))))
  "conflicts with previous import name")
(assert_invalid
  (component
    (type (component
      (export "a" (func))
      (export "A" (func)))))
  "conflicts with previous export name")
(assert_invalid
  (component
    (type (instance
      (export "foo-BAR-baz" (func))
      (export "FOO-bar-BAZ" (func)))))
  "conflicts with previous export name")
