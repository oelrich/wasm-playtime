(module
  ;; Import the function defined in the calling JavaScript.
  ;; This should be function #0 (or `$log`).
  (import "console" "log" (func $log (param i32 i32)))
  ;; Optionally select a function (#1) to run
  ;; by default after module load.
  (start 1)
  ;; Get some memory from the other side.
  (import "js" "mem" (memory 1))
  ;; Since this is the first function after the
  ;; function imports it is function #1.
  ;; Number of imports minus one.
  (func
    ;; I hereby DECLARE a local Register (or Variable)
    ;; for this here Anonymous Function.
    (local $idx i32)
    ;; Put a fiver on the stack.
    i32.const 5
    ;; Push it to the register.
    local.set $idx
    ;; Set up a block to exit with.
    block $mic_drop
    ;; And a loop to loop by.
    loop $right_round
    ;; Now we do the actual work.
    call $counted_popper
    ;; Hard, ardous work ...
    call $incr_popper_count
    ;; And lets see if we should do it again.
    ;; Start by pushing the value in our
    ;; register on the stack.
    local.get $idx
    ;; And a one; Ah, push it, push it good.
    i32.const 1
    ;; Do some algebra.
    i32.sub
    ;; Take the result and save to our little
    ;; register; but also leave a copy of the
    ;; result on the stack.
    local.tee $idx
    ;; Could this be the ring we are looking for?
    i32.eqz
    ;; If so, we are done!
    br_if $mic_drop
    ;; Sad emoji ...
    br $right_round
    end ;; End the loop
    end ;; End the block
  )
  ;; This function prints a 🎉
  ;; with a number in front.
  (func $counted_popper
    ;; Push 0 to the stack to tell `$log`
    ;; at what address in the memory it
    ;; should start.
    i32.const 0
    ;; And  value for how many bytes to use.
    i32.const 6
    ;; Invoke the funciton `$log`.
    call $log)
  ;; This does almost the sam thing as
  ;; `$counted_popper` but only prints
  ;; the party popper.
  ;; It is also exported and can be invoked
  ;; from the Other Side! Spooky! 👻
  (func (export "party_popper")
    i32.const 2
    i32.const 4
    call $log)
  ;; This function increases the value stored
  ;; at address 0 in the memory. That particular
  ;; address is instantiated to a cheerful 48, for
  ;; obvious raisins. For similar reasons it will
  ;; yield oddish results after sufficiently many
  ;; calls. Infinite Loopers beware.
  (func $incr_popper_count
    ;; This is where we want the result to land.
    i32.const 0
    ;; This is where the current value is.
    i32.const 0
    ;; Put it on the stack!
    i32.load
    ;; And then the value to increment by.
    i32.const 1
    ;; No, YOU do the math!
    i32.add
    ;; And with the stack in order; store.
    i32.store)
  ;; Since ASCII is built the way it is, this will
  ;; work best for 0 - 9.
  (data (i32.const 0) "0")
  ;; This could actually be in the thing above. Or
  ;; expressed as backslash escaped byte values. But
  ;; why not do it like this. And the popper is four
  ;; bytes long, hence the sort of odd string length
  ;; constants used when calling `$log` above.
  (data (i32.const 1) " 🎉")
)