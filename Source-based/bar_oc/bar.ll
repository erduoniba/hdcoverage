; ModuleID = 'bar.m'
source_filename = "bar.m"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-ios14.4.0-simulator"

@.str.6 = private unnamed_addr constant [12 x i8] c"result: %d\0A\00", align 1
@__llvm_coverage_mapping = internal constant { { i32, i32, i32, i32 }, [3 x <{ i64, i32, i64 }>], [232 x i8] } { { i32, i32, i32, i32 } { i32 3, i32 83, i32 149, i32 2 }, [3 x <{ i64, i32, i64 }>] [<{ i64, i32, i64 }> <{ i64 2232412992676883508, i32 9, i64 24 }>, <{ i64, i32, i64 }> <{ i64 5516051442789376587, i32 124, i64 279471023976941216 }>, <{ i64, i32, i64 }> <{ i64 -2624081020897602054, i32 9, i64 24 }>], [232 x i8] c"\01Q/Users/denglibing/HDProject/HarryProject/iOS/HDCoverage/Source-based/bar_oc/bar.m\01\00\00\01\01\03\17\02\02\01\00\08\01\05\02\09\02\09\02\09\1E\0D\02\09\1E\0D\02\09\10\01\07\17\0F\02\01\02\0A\00\11\05\00\12\00\93\80\80\80\08\05\00\13\02\06\02\02\06\01\8A\80\80\80\08\02\01\0A\08\06\02\00\0F\00\15\09\00\16\00\97\80\80\80\08\09\00\17\02\06\1E\02\06\01\8A\80\80\80\08\1E\01\0A\05\06\1E\00\0F\00\14\0D\00\15\00\96\80\80\80\08\0D\00\16\02\06\1A\02\06\01\8A\80\80\80\08\1A\01\0A\02\06\01\00\00\01\01\18\10\0B\02\00\00\00\00\00\00\00" }, section "__LLVM_COV,__llvm_covmap", align 8
@__llvm_profile_runtime = external local_unnamed_addr global i32
@__profc_add = private global [1 x i64] zeroinitializer, section "__DATA,__llvm_prf_cnts", align 8
@__profd_add = private global { i64, i64, i64*, i8*, i8*, i32, [2 x i16] } { i64 2232412992676883508, i64 24, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_add, i32 0, i32 0), i8* bitcast (i32 (i32, i32)* @add to i8*), i8* null, i32 1, [2 x i16] zeroinitializer }, section "__DATA,__llvm_prf_data,regular,live_support", align 8
@__profc_printTest = private global [4 x i64] zeroinitializer, section "__DATA,__llvm_prf_cnts", align 8
@__profd_printTest = private global { i64, i64, i64*, i8*, i8*, i32, [2 x i16] } { i64 5516051442789376587, i64 279471023976941216, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i32 0, i32 0), i8* bitcast (void (i32)* @printTest to i8*), i8* null, i32 4, [2 x i16] zeroinitializer }, section "__DATA,__llvm_prf_data,regular,live_support", align 8
@__profc_main = private global [1 x i64] zeroinitializer, section "__DATA,__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [2 x i16] } { i64 -2624081020897602054, i64 24, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 ()* @main to i8*), i8* null, i32 1, [2 x i16] zeroinitializer }, section "__DATA,__llvm_prf_data,regular,live_support", align 8
@__llvm_prf_nm = private constant [28 x i8] c"\12\1Ax\DAKLIa,(\CA\CC+\09I-.a\CCM\CC\CC\03\00>\04\06\9E", section "__DATA,__llvm_prf_names", align 1
@str = private unnamed_addr constant [6 x i8] c"begin\00", align 1
@str.7 = private unnamed_addr constant [12 x i8] c" input <= 0\00", align 1
@str.8 = private unnamed_addr constant [4 x i8] c"end\00", align 1
@str.9 = private unnamed_addr constant [17 x i8] c" 0 < input <= 60\00", align 1
@str.10 = private unnamed_addr constant [19 x i8] c" 60 < input <= 100\00", align 1
@str.11 = private unnamed_addr constant [13 x i8] c"input > 100 \00", align 1
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ { i32, i32, i32, i32 }, [3 x <{ i64, i32, i64 }>], [232 x i8] }* @__llvm_coverage_mapping to i8*), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__llvm_prf_nm, i32 0, i32 0), i8* bitcast (i32 ()* @__llvm_profile_runtime_user to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [2 x i16] }* @__profd_add to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [2 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [2 x i16] }* @__profd_printTest to i8*)], section "llvm.metadata"
; Function Attrs: nofree norecurse nounwind ssp uwtable
define i32 @add(i32 %0, i32 %1) #0 {
  %3 = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_add, i64 0, i64 0), align 8
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_add, i64 0, i64 0), align 8
  %5 = add nsw i32 %1, %0
  ret i32 %5
}
; Function Attrs: nofree nounwind ssp uwtable
define void @printTest(i32 %0) #1 {
  %2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 0), align 8
  %3 = add i64 %2, 1
  store i64 %3, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 0), align 8
  %4 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([6 x i8], [6 x i8]* @str, i64 0, i64 0))
  %5 = icmp sgt i32 %0, 100
  br i1 %5, label %10, label %6

6:                                                ; preds = %1
  %7 = icmp sgt i32 %0, 60
  br i1 %7, label %10, label %8

8:                                                ; preds = %6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %10, label %15

10:                                               ; preds = %8, %6, %1
  %11 = phi i64* [ getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 1), %1 ], [ getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 2), %6 ], [ getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 3), %8 ]
  %12 = phi i8* [ getelementptr inbounds ([13 x i8], [13 x i8]* @str.11, i64 0, i64 0), %1 ], [ getelementptr inbounds ([19 x i8], [19 x i8]* @str.10, i64 0, i64 0), %6 ], [ getelementptr inbounds ([17 x i8], [17 x i8]* @str.9, i64 0, i64 0), %8 ]
  %13 = load i64, i64* %11, align 8
  %14 = add i64 %13, 1
  store i64 %14, i64* %11, align 8
  br label %15

15:                                               ; preds = %10, %8
  %16 = phi i8* [ getelementptr inbounds ([12 x i8], [12 x i8]* @str.7, i64 0, i64 0), %8 ], [ %12, %10 ]
  %17 = tail call i32 @puts(i8* nonnull dereferenceable(1) %16)
  %18 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @str.8, i64 0, i64 0))
  ret void
}
; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2
; Function Attrs: nofree nounwind ssp uwtable
define i32 @main() #1 {
  %1 = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_main, i64 0, i64 0), align 8
  %2 = add i64 %1, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_main, i64 0, i64 0), align 8
  %3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 0), align 8
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 0), align 8
  %5 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([6 x i8], [6 x i8]* @str, i64 0, i64 0)) #5
  %6 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 3), align 8
  %7 = add i64 %6, 1
  store i64 %7, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 3), align 8
  %8 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([17 x i8], [17 x i8]* @str.9, i64 0, i64 0)) #5
  %9 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @str.8, i64 0, i64 0)) #5
  %10 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 0), align 8
  %11 = add i64 %10, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 0), align 8
  %12 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([6 x i8], [6 x i8]* @str, i64 0, i64 0)) #5
  %13 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 3), align 8
  %14 = add i64 %13, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 3), align 8
  %15 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([17 x i8], [17 x i8]* @str.9, i64 0, i64 0)) #5
  %16 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @str.8, i64 0, i64 0)) #5
  %17 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 0), align 8
  %18 = add i64 %17, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_printTest, i64 0, i64 0), align 8
  %19 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([6 x i8], [6 x i8]* @str, i64 0, i64 0)) #5
  %20 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str.7, i64 0, i64 0)) #5
  %21 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @str.8, i64 0, i64 0)) #5
  %22 = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_add, i64 0, i64 0), align 8
  %23 = add i64 %22, 1
  store i64 %23, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_add, i64 0, i64 0), align 8
  %24 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i32 3), !clang.arc.no_objc_arc_exceptions !10
  ret i32 0
}
; Function Attrs: noinline
define linkonce_odr hidden i32 @__llvm_profile_runtime_user() #3 {
  %1 = load i32, i32* @__llvm_profile_runtime, align 4
  ret i32 %1
}
; Function Attrs: nofree nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #4

attributes #0 = { nofree norecurse nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 4]}
!1 = !{i32 1, !"Objective-C Version", i32 2}
!2 = !{i32 1, !"Objective-C Image Info Version", i32 0}
!3 = !{i32 1, !"Objective-C Image Info Section", !"__DATA,__objc_imageinfo,regular,no_dead_strip"}
!4 = !{i32 4, !"Objective-C Garbage Collection", i32 0}
!5 = !{i32 1, !"Objective-C Is Simulated", i32 32}
!6 = !{i32 1, !"Objective-C Class Properties", i32 64}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{!"Apple clang version 12.0.0 (clang-1200.0.32.29)"}
!10 = !{}
