; ModuleID = '/home/master25/mae26/s.kim/RP/vitis_hls/rp_qaoa/qaoa_kernel/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>" = type { %"struct.ap_fixed_base<32, 12, true, AP_TRN, AP_WRAP, 0>" }
%"struct.ap_fixed_base<32, 12, true, AP_TRN, AP_WRAP, 0>" = type { %"struct.ssdm_int<32, true>" }
%"struct.ssdm_int<32, true>" = type { i32 }

; Function Attrs: noinline willreturn
define float @apatb_qaoa_kernel_ir([3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="3" %d, %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1" %gamma, %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1" %beta, i1 zeroext %get_best_state, i32* noalias nocapture nonnull %best_state) local_unnamed_addr #0 {
entry:
  %0 = bitcast [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %d to [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]*
  %d_copy = alloca [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]], align 512
  %1 = bitcast %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"* %gamma to [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]*
  %gamma_copy = alloca [1 x i32], align 512
  %2 = bitcast %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"* %beta to [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]*
  %beta_copy = alloca [1 x i32], align 512
  %best_state_copy = alloca i32, align 512
  call fastcc void @copy_in([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* nonnull %0, [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* nonnull align 512 %d_copy, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* nonnull %1, [1 x i32]* nonnull align 512 %gamma_copy, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* nonnull %2, [1 x i32]* nonnull align 512 %beta_copy, i32* nonnull %best_state, i32* nonnull align 512 %best_state_copy)
  %3 = call float @apatb_qaoa_kernel_hw([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %d_copy, [1 x i32]* %gamma_copy, [1 x i32]* %beta_copy, i1 %get_best_state, i32* %best_state_copy)
  call void @copy_back([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %0, [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %d_copy, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %1, [1 x i32]* %gamma_copy, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %2, [1 x i32]* %beta_copy, i32* %best_state, i32* %best_state_copy)
  ret float %3
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* noalias readonly "unpacked"="0", [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* noalias align 512 "unpacked"="1", [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* noalias readonly "unpacked"="2", [1 x i32]* noalias nocapture align 512 "unpacked"="3.0", [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* noalias readonly "unpacked"="4", [1 x i32]* noalias nocapture align 512 "unpacked"="5.0", i32* noalias readonly "unpacked"="6", i32* noalias align 512 "unpacked"="7") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a3a3struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* align 512 %1, [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %0)
  call fastcc void @"onebyonecpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>.315"([1 x i32]* align 512 %3, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>.315"([1 x i32]* align 512 %5, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %4)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %7, i32* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a3a3struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* noalias align 512 %dst, [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %dst, null
  %1 = icmp eq [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a3a3struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* nonnull %dst, [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* nonnull %src, i64 3)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a3a3struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %dst, [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %src, null
  %1 = icmp eq [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]], [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]], [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %dst.addr, [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %src.addr, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a3struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %dst, [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %src, null
  %1 = icmp eq [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"], [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"], [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %3, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %dst, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %src, null
  %1 = icmp eq [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"], [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"], [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %3, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0i32(i32* noalias align 512 %dst, i32* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq i32* %dst, null
  %1 = icmp eq i32* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = load i32, i32* %src, align 4
  store i32 %3, i32* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* noalias "unpacked"="0", [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* noalias readonly align 512 "unpacked"="1", [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="2", [1 x i32]* noalias nocapture readonly align 512 "unpacked"="3.0", [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="4", [1 x i32]* noalias nocapture readonly align 512 "unpacked"="5.0", i32* noalias "unpacked"="6", i32* noalias readonly align 512 "unpacked"="7") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a3a3struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %0, [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %2, [1 x i32]* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %4, [1 x i32]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %6, i32* align 512 %7)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"([1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="0" %dst, [1 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>.311"([1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* nonnull %dst, [1 x i32]* %src, i64 1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>.311"([1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* "unpacked"="0" %dst, [1 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [1 x i32], [1 x i32]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"], [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %1, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>.315"([1 x i32]* noalias nocapture align 512 "unpacked"="0.0" %dst, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>.318"([1 x i32]* %dst, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* nonnull %src, i64 1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a1struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>.318"([1 x i32]* nocapture "unpacked"="0.0" %dst, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"], [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [1 x i32], [1 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %1, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare i8* @malloc(i64)

declare void @free(i8*)

declare float @apatb_qaoa_kernel_hw([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]*, [1 x i32]*, [1 x i32]*, i1, i32*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* noalias "unpacked"="0", [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* noalias readonly align 512 "unpacked"="1", [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="2", [1 x i32]* noalias nocapture readonly align 512 "unpacked"="3.0", [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="4", [1 x i32]* noalias nocapture readonly align 512 "unpacked"="5.0", i32* noalias "unpacked"="6", i32* noalias readonly align 512 "unpacked"="7") unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0i32(i32* %6, i32* align 512 %7)
  ret void
}

declare float @qaoa_kernel_hw_stub([3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* noalias nocapture nonnull readonly, %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly, %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly, i1 zeroext, i32* noalias nocapture nonnull)

define float @qaoa_kernel_hw_stub_wrapper([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]*, [1 x i32]*, [1 x i32]*, i1, i32*) #5 {
entry:
  %5 = call i8* @malloc(i64 4)
  %6 = bitcast i8* %5 to [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]*
  %7 = call i8* @malloc(i64 4)
  %8 = bitcast i8* %7 to [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]*
  call void @copy_out([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* null, [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %0, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %6, [1 x i32]* %1, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %8, [1 x i32]* %2, i32* null, i32* %4)
  %9 = bitcast [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %0 to [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]*
  %10 = bitcast [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %6 to %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"*
  %11 = bitcast [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %8 to %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"*
  %12 = call float @qaoa_kernel_hw_stub([3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %9, %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"* %10, %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"* %11, i1 %3, i32* %4)
  call void @copy_in([3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* null, [3 x [3 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]]* %0, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %6, [1 x i32]* %1, [1 x %"struct.ap_fixed<32, 12, AP_TRN, AP_WRAP, 0>"]* %8, [1 x i32]* %2, i32* null, i32* %4)
  call void @free(i8* %5)
  call void @free(i8* %7)
  ret float %12
}

attributes #0 = { noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
