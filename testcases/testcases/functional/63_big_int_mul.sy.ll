%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%a\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c" %a\00", align 1
@_sysy_us = common dso_local local_unnamed_addr global [1024 x i32] zeroinitializer, align 16
@_sysy_s = common dso_local local_unnamed_addr global [1024 x i32] zeroinitializer, align 16
@_sysy_m = common dso_local local_unnamed_addr global [1024 x i32] zeroinitializer, align 16
@_sysy_h = common dso_local local_unnamed_addr global [1024 x i32] zeroinitializer, align 16
@_sysy_idx = common dso_local local_unnamed_addr global i32 0, align 4
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [35 x i8] c"Timer@%04d-%04d: %dH-%dM-%dS-%dus\0A\00", align 1
@_sysy_l1 = common dso_local local_unnamed_addr global [1024 x i32] zeroinitializer, align 16
@_sysy_l2 = common dso_local local_unnamed_addr global [1024 x i32] zeroinitializer, align 16
@.str.8 = private unnamed_addr constant [25 x i8] c"TOTAL: %dH-%dM-%dS-%dus\0A\00", align 1
@_sysy_start = common dso_local global %struct.timeval zeroinitializer, align 8
@_sysy_end = common dso_local global %struct.timeval zeroinitializer, align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @before_main, i8* null }]
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @after_main, i8* null }]

define dso_local i32 @getint() local_unnamed_addr #0 {
entry:
  %t = alloca i32, align 4
  %0 = bitcast i32* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #6
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %t)
  %1 = load i32, i32* %t, align 4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #6
  ret i32 %1
}

declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local i32 @__isoc99_scanf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

define dso_local i32 @getch() local_unnamed_addr #0 {
entry:
  %c = alloca i8, align 1
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %c) #6
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* nonnull %c)
  %0 = load i8, i8* %c, align 1
  %conv = sext i8 %0 to i32
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %c) #6
  ret i32 %conv
}

define dso_local float @getfloat() local_unnamed_addr #0 {
entry:
  %n = alloca float, align 4
  %0 = bitcast float* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #6
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), float* nonnull %n)
  %1 = load float, float* %n, align 4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #6
  ret float %1
}

define dso_local i32 @getarray(i32* %a) local_unnamed_addr #0 {
entry:
  %n = alloca i32, align 4
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #6
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %n)
  %1 = load i32, i32* %n, align 4
  %cmp5 = icmp sgt i32 %1, 0
  br i1 %cmp5, label %for.body, label %for.cond.cleanup

for.cond.cleanup:
  %.lcssa = phi i32 [ %1, %entry ], [ %2, %for.body ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #6
  ret i32 %.lcssa

for.body:
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %indvars.iv
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %arrayidx)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = load i32, i32* %n, align 4
  %3 = sext i32 %2 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %for.body, label %for.cond.cleanup
}

define dso_local i32 @getfarray(float* %a) local_unnamed_addr #0 {
entry:
  %n = alloca i32, align 4
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #6
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %n)
  %1 = load i32, i32* %n, align 4
  %cmp5 = icmp sgt i32 %1, 0
  br i1 %cmp5, label %for.body, label %for.cond.cleanup

for.cond.cleanup:
  %.lcssa = phi i32 [ %1, %entry ], [ %2, %for.body ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #6
  ret i32 %.lcssa

for.body:
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds float, float* %a, i64 %indvars.iv
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), float* %arrayidx)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = load i32, i32* %n, align 4
  %3 = sext i32 %2 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %for.body, label %for.cond.cleanup
}

define dso_local void @putint(i32 %a) local_unnamed_addr #3 {
entry:
  %call = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %a)
  ret void
}

declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

define dso_local void @putch(i32 %a) local_unnamed_addr #3 {
entry:
  %putchar = tail call i32 @putchar(i32 %a)
  ret void
}

define dso_local void @putarray(i32 %n, i32* nocapture readonly %a) local_unnamed_addr #3 {
entry:
  %call = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %n)
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.cond.cleanup:
  %putchar = tail call i32 @putchar(i32 10)
  ret void

for.body:
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4
  %call1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %0)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond.cleanup, label %for.body
}

define dso_local void @putfloat(float %a) local_unnamed_addr #3 {
entry:
  %conv = fpext float %a to double
  %call = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), double %conv)
  ret void
}

define dso_local void @putfarray(i32 %n, float* nocapture readonly %a) local_unnamed_addr #3 {
entry:
  %call = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %n)
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.cond.cleanup:
  %putchar = tail call i32 @putchar(i32 10)
  ret void

for.body:
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %a, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4
  %conv = fpext float %0 to double
  %call1 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), double %conv)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond.cleanup, label %for.body
}

define dso_local void @before_main() #4 {
entry:
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4096) bitcast ([1024 x i32]* @_sysy_us to i8*), i8 0, i64 4096, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4096) bitcast ([1024 x i32]* @_sysy_s to i8*), i8 0, i64 4096, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4096) bitcast ([1024 x i32]* @_sysy_m to i8*), i8 0, i64 4096, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4096) bitcast ([1024 x i32]* @_sysy_h to i8*), i8 0, i64 4096, i1 false)
  store i32 1, i32* @_sysy_idx, align 4
  ret void
}

define dso_local void @after_main() #3 {
entry:
  %0 = load i32, i32* @_sysy_idx, align 4
  %cmp37 = icmp sgt i32 %0, 1
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %cmp37, label %for.body, label %entry.for.cond.cleanup_crit_edge

entry.for.cond.cleanup_crit_edge:
  %.pre = load i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_h, i64 0, i64 0), align 16
  %.pre40 = load i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_m, i64 0, i64 0), align 16
  %.pre41 = load i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_s, i64 0, i64 0), align 16
  %.pre42 = load i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_us, i64 0, i64 0), align 16
  br label %for.cond.cleanup

for.cond.cleanup:
  %2 = phi i32 [ %.pre42, %entry.for.cond.cleanup_crit_edge ], [ %rem, %for.body ]
  %3 = phi i32 [ %.pre41, %entry.for.cond.cleanup_crit_edge ], [ %rem19, %for.body ]
  %4 = phi i32 [ %.pre40, %entry.for.cond.cleanup_crit_edge ], [ %rem23, %for.body ]
  %5 = phi i32 [ %.pre, %entry.for.cond.cleanup_crit_edge ], [ %add22, %for.body ]
  %.lcssa = phi %struct._IO_FILE* [ %1, %entry.for.cond.cleanup_crit_edge ], [ %23, %for.body ]
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.8, i64 0, i64 0), i32 %5, i32 %4, i32 %3, i32 %2) #7
  ret void

for.body:
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 1, %entry ]
  %6 = phi %struct._IO_FILE* [ %23, %for.body ], [ %1, %entry ]
  %arrayidx = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_l1, i64 0, i64 %indvars.iv
  %7 = load i32, i32* %arrayidx, align 4
  %arrayidx2 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_l2, i64 0, i64 %indvars.iv
  %8 = load i32, i32* %arrayidx2, align 4
  %arrayidx4 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_h, i64 0, i64 %indvars.iv
  %9 = load i32, i32* %arrayidx4, align 4
  %arrayidx6 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_m, i64 0, i64 %indvars.iv
  %10 = load i32, i32* %arrayidx6, align 4
  %arrayidx8 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_s, i64 0, i64 %indvars.iv
  %11 = load i32, i32* %arrayidx8, align 4
  %arrayidx10 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_us, i64 0, i64 %indvars.iv
  %12 = load i32, i32* %arrayidx10, align 4
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.7, i64 0, i64 0), i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12) #7
  %13 = load i32, i32* %arrayidx10, align 4
  %14 = load i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_us, i64 0, i64 0), align 16
  %add = add nsw i32 %14, %13
  %15 = load i32, i32* %arrayidx8, align 4
  %16 = load i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_s, i64 0, i64 0), align 16
  %add15 = add nsw i32 %16, %15
  %rem = srem i32 %add, 1000000
  store i32 %rem, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_us, i64 0, i64 0), align 16
  %17 = load i32, i32* %arrayidx6, align 4
  %18 = load i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_m, i64 0, i64 0), align 16
  %add18 = add nsw i32 %18, %17
  %rem19 = srem i32 %add15, 60
  store i32 %rem19, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_s, i64 0, i64 0), align 16
  %19 = load i32, i32* %arrayidx4, align 4
  %20 = load i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_h, i64 0, i64 0), align 16
  %add22 = add nsw i32 %20, %19
  store i32 %add22, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_h, i64 0, i64 0), align 16
  %rem23 = srem i32 %add18, 60
  store i32 %rem23, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @_sysy_m, i64 0, i64 0), align 16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = load i32, i32* @_sysy_idx, align 4
  %22 = sext i32 %21 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %22
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %cmp, label %for.body, label %for.cond.cleanup
}

declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

define dso_local void @_sysy_starttime(i32 %lineno) local_unnamed_addr #3 {
entry:
  %0 = load i32, i32* @_sysy_idx, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_l1, i64 0, i64 %idxprom
  store i32 %lineno, i32* %arrayidx, align 4
  %call = tail call i32 @gettimeofday(%struct.timeval* nonnull @_sysy_start, i8* null) #6
  ret void
}

declare dso_local i32 @gettimeofday(%struct.timeval* nocapture, i8* nocapture) local_unnamed_addr #2

define dso_local void @_sysy_stoptime(i32 %lineno) local_unnamed_addr #3 {
entry:
  %call = tail call i32 @gettimeofday(%struct.timeval* nonnull @_sysy_end, i8* null) #6
  %0 = load i32, i32* @_sysy_idx, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_l2, i64 0, i64 %idxprom
  store i32 %lineno, i32* %arrayidx, align 4
  %1 = load i64, i64* getelementptr inbounds (%struct.timeval, %struct.timeval* @_sysy_end, i64 0, i32 0), align 8
  %2 = load i64, i64* getelementptr inbounds (%struct.timeval, %struct.timeval* @_sysy_start, i64 0, i32 0), align 8
  %sub = sub nsw i64 %1, %2
  %mul = mul nsw i64 %sub, 1000000
  %3 = load i64, i64* getelementptr inbounds (%struct.timeval, %struct.timeval* @_sysy_end, i64 0, i32 1), align 8
  %add = add nsw i64 %mul, %3
  %4 = load i64, i64* getelementptr inbounds (%struct.timeval, %struct.timeval* @_sysy_start, i64 0, i32 1), align 8
  %sub1 = sub i64 %add, %4
  %arrayidx3 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_us, i64 0, i64 %idxprom
  %5 = load i32, i32* %arrayidx3, align 4
  %6 = trunc i64 %sub1 to i32
  %conv5 = add i32 %5, %6
  %div = sdiv i32 %conv5, 1000000
  %arrayidx9 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_s, i64 0, i64 %idxprom
  %7 = load i32, i32* %arrayidx9, align 4
  %add10 = add nsw i32 %div, %7
  %rem = srem i32 %conv5, 1000000
  store i32 %rem, i32* %arrayidx3, align 4
  %div15 = sdiv i32 %add10, 60
  %arrayidx17 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_m, i64 0, i64 %idxprom
  %8 = load i32, i32* %arrayidx17, align 4
  %add18 = add nsw i32 %div15, %8
  %rem21 = srem i32 %add10, 60
  store i32 %rem21, i32* %arrayidx9, align 4
  %div24 = sdiv i32 %add18, 60
  %arrayidx26 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_sysy_h, i64 0, i64 %idxprom
  %9 = load i32, i32* %arrayidx26, align 4
  %add27 = add nsw i32 %9, %div24
  store i32 %add27, i32* %arrayidx26, align 4
  %rem30 = srem i32 %add18, 60
  store i32 %rem30, i32* %arrayidx17, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @_sysy_idx, align 4
  ret void
}

declare i32 @putchar(i32) local_unnamed_addr #5

declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg)
attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree nounwind }
attributes #6 = { nounwind }
attributes #7 = { cold }
@__constant..20 = constant [20 x i32]  [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 0]
@__constant..28 = constant [20 x i32]  [i32 2, i32 3, i32 4, i32 2, i32 5, i32 7, i32 9, i32 9, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 4, i32 3, i32 2, i32 1, i32 2, i32 2]
@__constant..40 = constant [40 x i32] zeroinitializer
define i32 @main(){
.2:
  %.38 = alloca [40 x i32]
  %.36 = alloca [25 x i32]
  %.35 = alloca [25 x i32]
  %.32 = alloca i32
  %.30 = alloca i32
  %.26 = alloca [20 x i32]
  %.8 = alloca [20 x i32]
  %.7 = alloca i32
  %.6 = alloca i32
  %.5 = alloca i32
  %.4 = alloca i32
  %.3 = alloca i32
  call void @llvm.memcpy.p0.p0.i32([20 x i32]* %.8, [20 x i32]* @__constant..20, i32 80, i1 false)
  call void @llvm.memcpy.p0.p0.i32([20 x i32]* %.26, [20 x i32]* @__constant..28, i32 80, i1 false)
  store i32 20, i32* %.30
  store i32 20, i32* %.32
  call void @llvm.memcpy.p0.p0.i32([40 x i32]* %.38, [40 x i32]* @__constant..40, i32 160, i1 false)
  store i32 0, i32* %.3
  br label %.44wc15 
.44wc15:
  %.48 = load i32, i32* %.3
  %.49 = load i32, i32* %.30
  %.50 = icmp slt i32 %.48, %.49
  br i1 %.50, label %.45wloop.15.18, label %.46wn18
.45wloop.15.18:
  %.52 = load i32, i32* %.3
  %.53 = getelementptr inbounds [20 x i32], [20 x i32]* %.8, i32 0, i32 %.52
  %.54 = load i32, i32* %.53
  %.55 = load i32, i32* %.3
  %.56 = getelementptr inbounds [25 x i32], [25 x i32]* %.35, i32 0, i32 %.55
  store i32 %.54, i32* %.56
  %.58 = load i32, i32* %.3
  %.59 = add i32 %.58, 1
  store i32 %.59, i32* %.3
  br label %.44wc15 
.46wn18:
  store i32 0, i32* %.3
  br label %.63wc21 
.63wc21:
  %.67 = load i32, i32* %.3
  %.68 = load i32, i32* %.32
  %.69 = icmp slt i32 %.67, %.68
  br i1 %.69, label %.64wloop.21.24, label %.65wn24
.64wloop.21.24:
  %.71 = load i32, i32* %.3
  %.72 = getelementptr inbounds [20 x i32], [20 x i32]* %.26, i32 0, i32 %.71
  %.73 = load i32, i32* %.72
  %.74 = load i32, i32* %.3
  %.75 = getelementptr inbounds [25 x i32], [25 x i32]* %.36, i32 0, i32 %.74
  store i32 %.73, i32* %.75
  %.77 = load i32, i32* %.3
  %.78 = add i32 %.77, 1
  store i32 %.78, i32* %.3
  br label %.63wc21 
.65wn24:
  %.81 = load i32, i32* %.30
  %.82 = load i32, i32* %.32
  %.83 = add i32 %.81, %.82
  %.84 = sub i32 %.83, 1
  store i32 %.84, i32* %.6
  store i32 0, i32* %.3
  br label %.87wc29 
.87wc29:
  %.91 = load i32, i32* %.3
  %.92 = load i32, i32* %.6
  %.93 = icmp sle i32 %.91, %.92
  br i1 %.93, label %.88wloop.29.32, label %.89wn32
.88wloop.29.32:
  %.95 = load i32, i32* %.3
  %.96 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.95
  store i32 0, i32* %.96
  %.98 = load i32, i32* %.3
  %.99 = add i32 %.98, 1
  store i32 %.99, i32* %.3
  br label %.87wc29 
.89wn32:
  store i32 0, i32* %.7
  %.103 = load i32, i32* %.32
  %.104 = sub i32 %.103, 1
  store i32 %.104, i32* %.3
  br label %.106wc37 
.106wc37:
  %.110 = load i32, i32* %.3
  %.112 = icmp sgt i32 %.110, -1
  br i1 %.112, label %.107wloop.37.53, label %.108wn53
.107wloop.37.53:
  %.114 = load i32, i32* %.3
  %.115 = getelementptr inbounds [25 x i32], [25 x i32]* %.36, i32 0, i32 %.114
  %.116 = load i32, i32* %.115
  store i32 %.116, i32* %.5
  %.118 = load i32, i32* %.30
  %.119 = sub i32 %.118, 1
  store i32 %.119, i32* %.4
  br label %.121wc40 
.108wn53:
  %.184 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 0
  %.185 = load i32, i32* %.184
  %.186 = icmp ne i32 %.185, 0
  br i1 %.186, label %.182, label %.183
.121wc40:
  %.125 = load i32, i32* %.4
  %.126 = icmp sgt i32 %.125, -1
  br i1 %.126, label %.122wloop.40.50, label %.123wn50
.122wloop.40.50:
  %.128 = load i32, i32* %.6
  %.129 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.128
  %.130 = load i32, i32* %.129
  %.131 = load i32, i32* %.5
  %.132 = load i32, i32* %.4
  %.133 = getelementptr inbounds [25 x i32], [25 x i32]* %.35, i32 0, i32 %.132
  %.134 = load i32, i32* %.133
  %.135 = mul i32 %.131, %.134
  %.136 = add i32 %.130, %.135
  store i32 %.136, i32* %.7
  %.140 = load i32, i32* %.7
  %.142 = icmp sge i32 %.140, 10
  br i1 %.142, label %.138, label %.139
.123wn50:
  %.173 = load i32, i32* %.6
  %.174 = load i32, i32* %.30
  %.175 = add i32 %.173, %.174
  %.176 = sub i32 %.175, 1
  store i32 %.176, i32* %.6
  %.178 = load i32, i32* %.3
  %.179 = sub i32 %.178, 1
  store i32 %.179, i32* %.3
  br label %.106wc37 
.138:
  %.144 = load i32, i32* %.7
  %.145 = load i32, i32* %.6
  %.146 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.145
  store i32 %.144, i32* %.146
  %.148 = load i32, i32* %.6
  %.149 = sub i32 %.148, 1
  %.150 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.149
  %.151 = load i32, i32* %.150
  %.152 = load i32, i32* %.7
  %.153 = sdiv i32 %.152, 10
  %.154 = add i32 %.151, %.153
  %.155 = load i32, i32* %.6
  %.156 = sub i32 %.155, 1
  %.157 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.156
  store i32 %.154, i32* %.157
  br label %.159 
.139:
  %.161 = load i32, i32* %.7
  %.162 = load i32, i32* %.6
  %.163 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.162
  store i32 %.161, i32* %.163
  br label %.159 
.159:
  %.166 = load i32, i32* %.4
  %.167 = sub i32 %.166, 1
  store i32 %.167, i32* %.4
  %.169 = load i32, i32* %.6
  %.170 = sub i32 %.169, 1
  store i32 %.170, i32* %.6
  br label %.121wc40 
.182:
  %.188 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 0
  %.189 = load i32, i32* %.188
  call void @putint(i32 %.189)
  br label %.183 
.183:
  store i32 1, i32* %.3
  br label %.194wc59 
.194wc59:
  %.198 = load i32, i32* %.3
  %.199 = load i32, i32* %.30
  %.200 = load i32, i32* %.32
  %.201 = add i32 %.199, %.200
  %.202 = sub i32 %.201, 1
  %.203 = icmp sle i32 %.198, %.202
  br i1 %.203, label %.195wloop.59.62, label %.196wn62
.195wloop.59.62:
  %.205 = load i32, i32* %.3
  %.206 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.205
  %.207 = load i32, i32* %.206
  call void @putint(i32 %.207)
  %.209 = load i32, i32* %.3
  %.210 = add i32 %.209, 1
  store i32 %.210, i32* %.3
  br label %.194wc59 
.196wn62:
  ret i32 0 
}
@__constant..20 = constant [20 x i32]  [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 0]
@__constant..28 = constant [20 x i32]  [i32 2, i32 3, i32 4, i32 2, i32 5, i32 7, i32 9, i32 9, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 4, i32 3, i32 2, i32 1, i32 2, i32 2]
@__constant..40 = constant [40 x i32] zeroinitializer
define i32 @main(){
.2:
  %.38 = alloca [40 x i32]
  %.36 = alloca [25 x i32]
  %.35 = alloca [25 x i32]
  %.32 = alloca i32
  %.30 = alloca i32
  %.26 = alloca [20 x i32]
  %.8 = alloca [20 x i32]
  %.7 = alloca i32
  %.6 = alloca i32
  %.5 = alloca i32
  %.4 = alloca i32
  %.3 = alloca i32
  call void @llvm.memcpy.p0.p0.i32([20 x i32]* %.8, [20 x i32]* @__constant..20, i32 80, i1 false)
  call void @llvm.memcpy.p0.p0.i32([20 x i32]* %.26, [20 x i32]* @__constant..28, i32 80, i1 false)
  store i32 20, i32* %.30
  store i32 20, i32* %.32
  call void @llvm.memcpy.p0.p0.i32([40 x i32]* %.38, [40 x i32]* @__constant..40, i32 160, i1 false)
  store i32 0, i32* %.3
  br label %.44wc15 
.44wc15:
  %.48 = load i32, i32* %.3
  %.49 = load i32, i32* %.30
  %.50 = icmp slt i32 %.48, %.49
  br i1 %.50, label %.45wloop.15.18, label %.46wn18
.45wloop.15.18:
  %.52 = load i32, i32* %.3
  %.53 = getelementptr inbounds [20 x i32], [20 x i32]* %.8, i32 0, i32 %.52
  %.54 = load i32, i32* %.53
  %.55 = load i32, i32* %.3
  %.56 = getelementptr inbounds [25 x i32], [25 x i32]* %.35, i32 0, i32 %.55
  store i32 %.54, i32* %.56
  %.58 = load i32, i32* %.3
  %.59 = add i32 %.58, 1
  store i32 %.59, i32* %.3
  br label %.44wc15 
.46wn18:
  store i32 0, i32* %.3
  br label %.63wc21 
.63wc21:
  %.67 = load i32, i32* %.3
  %.68 = load i32, i32* %.32
  %.69 = icmp slt i32 %.67, %.68
  br i1 %.69, label %.64wloop.21.24, label %.65wn24
.64wloop.21.24:
  %.71 = load i32, i32* %.3
  %.72 = getelementptr inbounds [20 x i32], [20 x i32]* %.26, i32 0, i32 %.71
  %.73 = load i32, i32* %.72
  %.74 = load i32, i32* %.3
  %.75 = getelementptr inbounds [25 x i32], [25 x i32]* %.36, i32 0, i32 %.74
  store i32 %.73, i32* %.75
  %.77 = load i32, i32* %.3
  %.78 = add i32 %.77, 1
  store i32 %.78, i32* %.3
  br label %.63wc21 
.65wn24:
  %.81 = load i32, i32* %.30
  %.82 = load i32, i32* %.32
  %.83 = add i32 %.81, %.82
  %.84 = sub i32 %.83, 1
  store i32 %.84, i32* %.6
  store i32 0, i32* %.3
  br label %.87wc29 
.87wc29:
  %.91 = load i32, i32* %.3
  %.92 = load i32, i32* %.6
  %.93 = icmp sle i32 %.91, %.92
  br i1 %.93, label %.88wloop.29.32, label %.89wn32
.88wloop.29.32:
  %.95 = load i32, i32* %.3
  %.96 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.95
  store i32 0, i32* %.96
  %.98 = load i32, i32* %.3
  %.99 = add i32 %.98, 1
  store i32 %.99, i32* %.3
  br label %.87wc29 
.89wn32:
  store i32 0, i32* %.7
  %.103 = load i32, i32* %.32
  %.104 = sub i32 %.103, 1
  store i32 %.104, i32* %.3
  br label %.106wc37 
.106wc37:
  %.110 = load i32, i32* %.3
  %.112 = icmp sgt i32 %.110, -1
  br i1 %.112, label %.107wloop.37.53, label %.108wn53
.107wloop.37.53:
  %.114 = load i32, i32* %.3
  %.115 = getelementptr inbounds [25 x i32], [25 x i32]* %.36, i32 0, i32 %.114
  %.116 = load i32, i32* %.115
  store i32 %.116, i32* %.5
  %.118 = load i32, i32* %.30
  %.119 = sub i32 %.118, 1
  store i32 %.119, i32* %.4
  br label %.121wc40 
.108wn53:
  %.184 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 0
  %.185 = load i32, i32* %.184
  %.186 = icmp ne i32 %.185, 0
  br i1 %.186, label %.182, label %.183
.121wc40:
  %.125 = load i32, i32* %.4
  %.126 = icmp sgt i32 %.125, -1
  br i1 %.126, label %.122wloop.40.50, label %.123wn50
.122wloop.40.50:
  %.128 = load i32, i32* %.6
  %.129 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.128
  %.130 = load i32, i32* %.129
  %.131 = load i32, i32* %.5
  %.132 = load i32, i32* %.4
  %.133 = getelementptr inbounds [25 x i32], [25 x i32]* %.35, i32 0, i32 %.132
  %.134 = load i32, i32* %.133
  %.135 = mul i32 %.131, %.134
  %.136 = add i32 %.130, %.135
  store i32 %.136, i32* %.7
  %.140 = load i32, i32* %.7
  %.142 = icmp sge i32 %.140, 10
  br i1 %.142, label %.138, label %.139
.123wn50:
  %.173 = load i32, i32* %.6
  %.174 = load i32, i32* %.30
  %.175 = add i32 %.173, %.174
  %.176 = sub i32 %.175, 1
  store i32 %.176, i32* %.6
  %.178 = load i32, i32* %.3
  %.179 = sub i32 %.178, 1
  store i32 %.179, i32* %.3
  br label %.106wc37 
.138:
  %.144 = load i32, i32* %.7
  %.145 = load i32, i32* %.6
  %.146 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.145
  store i32 %.144, i32* %.146
  %.148 = load i32, i32* %.6
  %.149 = sub i32 %.148, 1
  %.150 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.149
  %.151 = load i32, i32* %.150
  %.152 = load i32, i32* %.7
  %.153 = sdiv i32 %.152, 10
  %.154 = add i32 %.151, %.153
  %.155 = load i32, i32* %.6
  %.156 = sub i32 %.155, 1
  %.157 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.156
  store i32 %.154, i32* %.157
  br label %.159 
.139:
  %.161 = load i32, i32* %.7
  %.162 = load i32, i32* %.6
  %.163 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 %.162
  store i32 %.161, i32* %.163
  br label %.159 
.159:
  %.166 = load i32, i32* %.4
  %.167 = sub i32 %.166, 1
  store i32 %.167, i32* %.4
  %.169 = load i32, i32* %.6
  %.170 = sub i32 %.169, 1
  store i32 %.170, i32* %.6
  br label %.121wc40 
.182:
  %.188 = getelementptr inbounds [40 x i32], [40 x i32]* %.38, i32 0, i32 0
  %.189 = load i32, i32* %.188
  call void @putint(i32 %.189)
  br label %.183 
.183:
  store i32 1, i32* %.3
  br label %.194wc59 
.194wc59:
  %.198 = load i32, i32* %.3
  %.199 = load i32, i32* %.30
  %.200 = load i32, i32* %.32
  %.201 = add i32 %.199, %.200
  %.202 = sub i32 %.201, 1
  %.203 = icmp sle i32 %.198, %.202
  br i1 %.203, label %.195wloop.59.62, label %.196wn62
.195wloop.59.62:
  %.205 = load i32, i32* %.3
  %.206 = getelementptr inbounds [40 x i32], [4