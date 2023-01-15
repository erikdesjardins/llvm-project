; RUN: not llvm-as < %s -o /dev/null 2>&1 | FileCheck %s

define i8 @f2(i8 range(!1) %x) {
entry:
  ret i8 %x
}
!1 = !{}
; CHECK: It should have at least one range!

define i8 @f3(i8 range(!2) %x) {
entry:
  ret i8 %x
}
!2 = !{i8 0}
; CHECK: Unfinished range!

define i8 @f4(i8 range(!3) %x) {
entry:
  ret i8 %x
}
!3 = !{double 0.0, i8 0}
; CHECK: The lower limit must be an integer!

define i8 @f5(i8 range(!4) %x) {
entry:
  ret i8 %x
}
!4 = !{i8 0, double 0.0}
; CHECK: The upper limit must be an integer!

define i8 @f6(i8 range(!5) %x) {
entry:
  ret i8 %x
}
!5 = !{i32 0, i8 0}
; CHECK: Range types must match instruction type!
; CHECK: i8

define i8 @f7(i8 range(!6) %x) {
entry:
  ret i8 %x
}
!6 = !{i8 0, i32 0}
; CHECK: Range types must match instruction type!
; CHECK: i8

define i8 @f8(i8 range(!7) %x) {
entry:
  ret i8 %x
}
!7 = !{i32 0, i32 0}
; CHECK: Range types must match instruction type!
; CHECK: i8

define i8 @f9(i8 range(!8) %x) {
entry:
  ret i8 %x
}
!8 = !{i8 0, i8 0}
; CHECK: Range must not be empty!

define i8 @f10(i8 range(!9) %x) {
entry:
  ret i8 %x
}
!9 = !{i8 0, i8 2, i8 1, i8 3}
; CHECK: Intervals are overlapping

define i8 @f11(i8 range(!10) %x) {
entry:
  ret i8 %x
}
!10 = !{i8 0, i8 2, i8 2, i8 3}
; CHECK: Intervals are contiguous

define i8 @f12(i8 range(!11) %x) {
entry:
  ret i8 %x
}
!11 = !{i8 1, i8 2, i8 -1, i8 0}
; CHECK: Intervals are not in order

define i8 @f13(i8 range(!12) %x) {
entry:
  ret i8 %x
}
!12 = !{i8 1, i8 3, i8 5, i8 1}
; CHECK: Intervals are contiguous

define i8 @f14(i8 range(!13) %x) {
entry:
  ret i8 %x
}
!13 = !{i8 1, i8 3, i8 5, i8 2}
; CHECK: Intervals are overlapping

define i8 @f15(i8 range(!14) %x) {
entry:
  ret i8 %x
}
!14 = !{i8 10, i8 1, i8 12, i8 13}
; CHECK: Intervals are overlapping

define i8 @f16(i8 range(!16) %x) {
entry:
  ret i8 %x
}
!16 = !{i8 1, i8 3, i8 4, i8 5, i8 6, i8 2}
; CHECK: Intervals are overlapping

define i8 @f17(i8 range(!17) %x) {
entry:
  ret i8 %x
}
!17 = !{i8 1, i8 3, i8 4, i8 5, i8 6, i8 1}
; CHECK: Intervals are contiguous
