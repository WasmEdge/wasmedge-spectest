;; RUN: wast --assert default --snapshot tests/snapshots %

(component
  (component
    (import "a" (func))
    (import "b" (instance))
    (import "c" (instance
      (export "a" (func))
    ))
    (import "d" (component
      (import "a" (core module))
      (export "b" (func))
    ))
    (type $t (func))
    (import "e" (type (eq $t)))
  )
)

(assert_invalid
  (component
    (type $f (func))
    (import "a" (instance (type $f)))
  )
  "unknown instance type")

(assert_invalid
  (component
    (core type $f (func))
    (import "a" (core module (type $f)))
  )
  "unknown module type")

(assert_invalid
  (component
    (type $f string)
    (import "a" (func (type $f)))
  )
  "unknown function type")

;; Disallow duplicate imports for core wasm modules
(assert_invalid
  (component
    (core type (module
      (import "" "" (func))
      (import "" "" (func))
    ))
  )
  "duplicate import name")
(assert_invalid
  (component
    (core module
      (import "" "" (func))
      (import "" "" (func))
    )
  )
  "duplicate import name")
(assert_invalid
  (component
    (core type (module
      (import "" "a" (func))
      (import "" "a" (func))
    ))
  )
  "duplicate import name")
(assert_invalid
  (component
    (core module
      (import "" "a" (func))
      (import "" "a" (func))
    )
  )
  "duplicate import name")

(assert_invalid
  (component
    (import "a" (func))
    (import "a" (func))
  )
  "import name conflicts with previous name")

(assert_invalid
  (component
    (type (component
      (import "a" (func))
      (import "a" (func))
    ))
  )
  "import name conflicts with previous name")

(assert_invalid
  (component
    (import "a" (func (type 100)))
  )
  "type index out of bounds")

(assert_invalid
  (component
    (core module $m (func (export "")))
    (core instance $i (instantiate $m))
    (func (type 100) (canon lift (core func $i "")))
  )
  "type index out of bounds")

(component definition
  (import "wasi:http/types" (func))
  (import "wasi:http/types@1.0.0" (func))
  (import "wasi:http/types@2.0.0" (func))
  (import "a-b:c-d/e-f@123456.7890.488" (func))
  (import "a:b/c@1.2.3" (func))
  (import "a:b/c@0.0.0" (func))
  (import "a:b/c@0.0.0+abcd" (func))
  (import "a:b/c@0.0.0+abcd-efg" (func))
  (import "a:b/c@0.0.0-abcd+efg" (func))
  (import "a:b/c@0.0.0-abcd.1.2+efg.4.ee.5" (func))
)

(assert_invalid
  (component
    (import "wasi:http/types" (func))
    (import "wasi:http/types" (func))
  )
  "import name conflicts with previous name")

(assert_invalid
  (component (import "" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "wasi:" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "wasi:/" (func)))
  "not in kebab case")
(assert_invalid
  (component (import ":/" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "wasi/http" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "wasi:http/TyPeS" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "WaSi:http/types" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "wasi:HtTp/types" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "wasi:http/types@" (func)))
  "empty string")
(assert_invalid
  (component (import "wasi:http/types@." (func)))
  "unexpected character")
(assert_invalid
  (component (import "wasi:http/types@1." (func)))
  "unexpected end of input")
(assert_invalid
  (component (import "wasi:http/types@a.2" (func)))
  "unexpected character")
(assert_invalid
  (component (import "wasi:http/types@2.b" (func)))
  "unexpected character")
(assert_invalid
  (component (import "wasi:http/types@2.0x0" (func)))
  "unexpected character")
(assert_invalid
  (component (import "wasi:http/types@2.0.0+" (func)))
  "empty identifier segment")
(assert_invalid
  (component (import "wasi:http/types@2.0.0-" (func)))
  "empty identifier segment")
(assert_invalid
  (component (import "foo:bar:baz/qux" (func)))
  "expected `/` after package name")
(assert_invalid
  (component (import "foo:bar/baz/qux" (func)))
  "trailing characters found")

(component
  (component
    (import "a" (func $a))
    (export "a" (func $a))
  )
)

(component definition
  (import "unlocked-dep=<a:b>" (func))
  (import "unlocked-dep=<a:b@*>" (func))
  (import "unlocked-dep=<a:b@{>=1.2.3}>" (func))
  (import "unlocked-dep=<a:b@{>=1.2.3-rc}>" (func))
  (import "unlocked-dep=<a:b@{<1.2.3}>" (func))
  (import "unlocked-dep=<a:b@{<1.2.3-rc}>" (func))
  (import "unlocked-dep=<a:b@{>=1.2.3 <1.2.3}>" (func))
  (import "unlocked-dep=<a:b@{>=1.2.3-rc <1.2.3}>" (func))
)

(assert_invalid
  (component (import "unlocked-dep=" (func)))
  "expected `<`")
(assert_invalid
  (component (import "unlocked-dep=<" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "unlocked-dep=<>" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "unlocked-dep=<:>" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "unlocked-dep=<a:>" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "unlocked-dep=<:a>" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "unlocked-dep=<a:a@>" (func)))
  "expected `{`")
(assert_invalid
  (component (import "unlocked-dep=<a:a@{xyz}>" (func)))
  "expected `>=` or `<` at start of version range")
(assert_invalid
  (component (import "unlocked-dep=<a:a@{<xyz}>" (func)))
  "not a valid semver")
(assert_invalid
  (component (import "unlocked-dep=<a:a@{<1.2.3 >=2.3.4}>" (func)))
  "not a valid semver")

(component definition
  (import "locked-dep=<a:b>" (func))
  (import "locked-dep=<a:b@1.2.3>" (func))
  (import "locked-dep=<a:b>,integrity=<sha256-a>" (func))
  (import "locked-dep=<a:b@1.2.3>,integrity=<sha256-a>" (func))
)

(assert_invalid
  (component (import "locked-dep=" (func)))
  "expected `<`")
(assert_invalid
  (component (import "locked-dep=<" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "locked-dep=<:" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "locked-dep=<:>" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "locked-dep=<a:>" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "locked-dep=<:a>" (func)))
  "not in kebab case")
(assert_invalid
  (component (import "locked-dep=<a:a" (func)))
  "expected `>`")
(assert_invalid
  (component (import "locked-dep=<a:a@>" (func)))
  "not a valid semver")
(assert_invalid
  (component (import "locked-dep=<a:a@1.2.3" (func)))
  "expected `>`")
(assert_invalid
  (component (import "locked-dep=<a:a@1.2.3>," (func)))
  "expected `integrity=<`")
(assert_invalid
  (component (import "locked-dep=<a:a@1.2.3>x" (func)))
  "trailing characters found")

(component definition
  (import "url=<>" (func))
  (import "url=<a>" (func))
  (import "url=<a>,integrity=<sha256-a>" (func))
)

(assert_invalid
  (component (import "url=" (func)))
  "expected `<`")
(assert_invalid
  (component (import "url=<" (func)))
  "failed to find `>`")
(assert_invalid
  (component (import "url=<<>" (func)))
  "url cannot contain `<`")

(assert_invalid
  (component
    (import "relative-url=<>" (func))
    (import "relative-url=<a>" (func))
    (import "relative-url=<a>,integrity=<sha256-a>" (func))
  )
  "not a valid extern name")

(assert_invalid
  (component (import "relative-url=" (func)))
  "not a valid extern name")
(assert_invalid
  (component (import "relative-url=<" (func)))
  "not a valid extern name")
(assert_invalid
  (component (import "relative-url=<<>" (func)))
  "not a valid extern name")

(component definition
  (import "integrity=<sha256-a>" (func))
  (import "integrity=<sha384-a>" (func))
  (import "integrity=<sha512-a>" (func))
  (import "integrity=<sha512-a sha256-b>" (func))
  (import "integrity=< sha512-a sha256-b >" (func))
  (import "integrity=<  sha512-a?abcd  >" (func))
  (import "integrity=<sha256-abcdefghijklmnopqrstuvwxyz>" (func))
  (import "integrity=<sha256-ABCDEFGHIJKLMNOPQRSTUVWXYZ>" (func))
  (import "integrity=<sha256-++++++++++++++++++++==>" (func))
  (import "integrity=<sha256-////////////////////==>" (func))
)
(assert_invalid
  (component (import "integrity=<>" (func)))
  "integrity hash cannot be empty")
(assert_invalid
  (component (import "integrity=<sha256>" (func)))
  "expected `-` after hash algorithm")
(assert_invalid
  (component (import "integrity=<sha256->" (func)))
  "not valid base64")
(assert_invalid
  (component (import "integrity=<sha256-^^^^>" (func)))
  "not valid base64")
(assert_invalid
  (component (import "integrity=<sha256-=========>" (func)))
  "not valid base64")
(assert_invalid
  (component (import "integrity=<sha256-=>" (func)))
  "not valid base64")
(assert_invalid
  (component (import "integrity=<sha256-==>" (func)))
  "not valid base64")
(assert_invalid
  (component (import "integrity=<md5-ABC>" (func)))
  "unrecognized hash algorithm")
