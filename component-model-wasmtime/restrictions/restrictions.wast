(component (import "x" (component)))

(component (component (export "x")))

(component
  (import "f" (func $f))
  (export "f" (func $f))
)

(component
  (import "x" (component
    (export "x" (type (sub resource)))
  ))
)
