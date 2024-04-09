	.file	"93_matrix_sub.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	N
	.section	.sbss,"aw",@nobits
	.align	2
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.globl	M
	.align	2
	.type	M, @object
	.size	M, 4
M:
	.zero	4
	.globl	L
	.align	2
	.type	L, @object
	.size	L, 4
L:
	.zero	4
	.text
	.align	1
	.globl	sub
	.type	sub, @function
sub:
	addi	sp,sp,-96
	sd	s0,88(sp)
	addi	s0,sp,96
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	sd	a3,-64(s0)
	sd	a4,-72(s0)
	sd	a5,-80(s0)
	sd	a6,-88(s0)
	sd	a7,-96(s0)
	sw	zero,-20(s0)
	j	.L2
.L3:
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a3,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-64(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a2,-88(s0)
	add	a5,a2,a5
	subw	a4,a3,a4
	sext.w	a4,a4
	sw	a4,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-48(s0)
	add	a5,a4,a5
	lw	a3,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-72(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a2,-96(s0)
	add	a5,a2,a5
	subw	a4,a3,a4
	sext.w	a4,a4
	sw	a4,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a3,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-80(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a2,0(s0)
	add	a5,a2,a5
	subw	a4,a3,a4
	sext.w	a4,a4
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L3
	li	a5,0
	mv	a0,a5
	ld	s0,88(sp)
	addi	sp,sp,96
	jr	ra
	.size	sub, .-sub
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-192
	sd	ra,184(sp)
	sd	s0,176(sp)
	addi	s0,sp,192
	lui	a5,%hi(N)
	li	a4,3
	sw	a4,%lo(N)(a5)
	lui	a5,%hi(M)
	li	a4,3
	sw	a4,%lo(M)(a5)
	lui	a5,%hi(L)
	li	a4,3
	sw	a4,%lo(L)(a5)
	sw	zero,-20(s0)
	j	.L6
.L7:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-20(s0)
	sw	a4,-24(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-20(s0)
	sw	a4,-40(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-20(s0)
	sw	a4,-56(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-20(s0)
	sw	a4,-72(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-20(s0)
	sw	a4,-88(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-20(s0)
	sw	a4,-104(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L6:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L7
	addi	a7,s0,-160
	addi	a6,s0,-144
	addi	t1,s0,-120
	addi	a4,s0,-104
	addi	a3,s0,-88
	addi	a2,s0,-72
	addi	a1,s0,-56
	addi	a0,s0,-40
	addi	a5,s0,-176
	sd	a5,0(sp)
	mv	a5,t1
	call	sub
	mv	a5,a0
	sw	a5,-20(s0)
	j	.L8
.L9:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-128(a5)
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	mv	a0,a5
	call	putint
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L8:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L9
	li	a5,10
	sw	a5,-24(s0)
	sw	zero,-20(s0)
	lw	a5,-24(s0)
	mv	a0,a5
	call	putch
	j	.L10
.L11:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-144(a5)
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	mv	a0,a5
	call	putint
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L10:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L11
	li	a5,10
	sw	a5,-24(s0)
	sw	zero,-20(s0)
	lw	a5,-24(s0)
	mv	a0,a5
	call	putch
	j	.L12
.L13:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-160(a5)
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	mv	a0,a5
	call	putint
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L12:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L13
	li	a5,10
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	mv	a0,a5
	call	putch
	li	a5,0
	mv	a0,a5
	ld	ra,184(sp)
	ld	s0,176(sp)
	addi	sp,sp,192
	jr	ra
	.size	main, .-main
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
