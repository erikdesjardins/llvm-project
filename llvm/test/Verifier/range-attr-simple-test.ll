; RUN: not llvm-as < %s -o /dev/null 2>&1 | FileCheck %s

!2 = !{i8 0}

define i8 @f3(i8 range(!2) %x) {
entry:
  ret i8 %x
}

; CHECK: Unfinished range!
