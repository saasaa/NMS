
a.out:     file format elf64-x86-64


Disassembly of section .init:

00000000004007c0 <_init>:
  4007c0:	48 83 ec 08          	sub    $0x8,%rsp
  4007c4:	48 8b 05 2d 18 20 00 	mov    0x20182d(%rip),%rax        # 601ff8 <_DYNAMIC+0x1e0>
  4007cb:	48 85 c0             	test   %rax,%rax
  4007ce:	74 05                	je     4007d5 <_init+0x15>
  4007d0:	e8 7b 00 00 00       	callq  400850 <__gmon_start__@plt>
  4007d5:	48 83 c4 08          	add    $0x8,%rsp
  4007d9:	c3                   	retq   

Disassembly of section .plt:

00000000004007e0 <_gfortran_st_read@plt-0x10>:
  4007e0:	ff 35 22 18 20 00    	pushq  0x201822(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4007e6:	ff 25 24 18 20 00    	jmpq   *0x201824(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4007ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004007f0 <_gfortran_st_read@plt>:
  4007f0:	ff 25 22 18 20 00    	jmpq   *0x201822(%rip)        # 602018 <_GLOBAL_OFFSET_TABLE_+0x18>
  4007f6:	68 00 00 00 00       	pushq  $0x0
  4007fb:	e9 e0 ff ff ff       	jmpq   4007e0 <_init+0x20>

0000000000400800 <_gfortran_st_read_done@plt>:
  400800:	ff 25 1a 18 20 00    	jmpq   *0x20181a(%rip)        # 602020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400806:	68 01 00 00 00       	pushq  $0x1
  40080b:	e9 d0 ff ff ff       	jmpq   4007e0 <_init+0x20>

0000000000400810 <_gfortran_set_options@plt>:
  400810:	ff 25 12 18 20 00    	jmpq   *0x201812(%rip)        # 602028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400816:	68 02 00 00 00       	pushq  $0x2
  40081b:	e9 c0 ff ff ff       	jmpq   4007e0 <_init+0x20>

0000000000400820 <_gfortran_transfer_character_write@plt>:
  400820:	ff 25 0a 18 20 00    	jmpq   *0x20180a(%rip)        # 602030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400826:	68 03 00 00 00       	pushq  $0x3
  40082b:	e9 b0 ff ff ff       	jmpq   4007e0 <_init+0x20>

0000000000400830 <_gfortran_transfer_real@plt>:
  400830:	ff 25 02 18 20 00    	jmpq   *0x201802(%rip)        # 602038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400836:	68 04 00 00 00       	pushq  $0x4
  40083b:	e9 a0 ff ff ff       	jmpq   4007e0 <_init+0x20>

0000000000400840 <__libc_start_main@plt>:
  400840:	ff 25 fa 17 20 00    	jmpq   *0x2017fa(%rip)        # 602040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400846:	68 05 00 00 00       	pushq  $0x5
  40084b:	e9 90 ff ff ff       	jmpq   4007e0 <_init+0x20>

0000000000400850 <__gmon_start__@plt>:
  400850:	ff 25 f2 17 20 00    	jmpq   *0x2017f2(%rip)        # 602048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400856:	68 06 00 00 00       	pushq  $0x6
  40085b:	e9 80 ff ff ff       	jmpq   4007e0 <_init+0x20>

0000000000400860 <_gfortran_rand@plt>:
  400860:	ff 25 ea 17 20 00    	jmpq   *0x2017ea(%rip)        # 602050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400866:	68 07 00 00 00       	pushq  $0x7
  40086b:	e9 70 ff ff ff       	jmpq   4007e0 <_init+0x20>

0000000000400870 <_gfortran_transfer_real_write@plt>:
  400870:	ff 25 e2 17 20 00    	jmpq   *0x2017e2(%rip)        # 602058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400876:	68 08 00 00 00       	pushq  $0x8
  40087b:	e9 60 ff ff ff       	jmpq   4007e0 <_init+0x20>

0000000000400880 <_gfortran_transfer_integer@plt>:
  400880:	ff 25 da 17 20 00    	jmpq   *0x2017da(%rip)        # 602060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400886:	68 09 00 00 00       	pushq  $0x9
  40088b:	e9 50 ff ff ff       	jmpq   4007e0 <_init+0x20>

0000000000400890 <_gfortran_st_write_done@plt>:
  400890:	ff 25 d2 17 20 00    	jmpq   *0x2017d2(%rip)        # 602068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400896:	68 0a 00 00 00       	pushq  $0xa
  40089b:	e9 40 ff ff ff       	jmpq   4007e0 <_init+0x20>

00000000004008a0 <_gfortran_set_args@plt>:
  4008a0:	ff 25 ca 17 20 00    	jmpq   *0x2017ca(%rip)        # 602070 <_GLOBAL_OFFSET_TABLE_+0x70>
  4008a6:	68 0b 00 00 00       	pushq  $0xb
  4008ab:	e9 30 ff ff ff       	jmpq   4007e0 <_init+0x20>

00000000004008b0 <_gfortran_st_write@plt>:
  4008b0:	ff 25 c2 17 20 00    	jmpq   *0x2017c2(%rip)        # 602078 <_GLOBAL_OFFSET_TABLE_+0x78>
  4008b6:	68 0c 00 00 00       	pushq  $0xc
  4008bb:	e9 20 ff ff ff       	jmpq   4007e0 <_init+0x20>

Disassembly of section .text:

00000000004008c0 <_start>:
  4008c0:	31 ed                	xor    %ebp,%ebp
  4008c2:	49 89 d1             	mov    %rdx,%r9
  4008c5:	5e                   	pop    %rsi
  4008c6:	48 89 e2             	mov    %rsp,%rdx
  4008c9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4008cd:	50                   	push   %rax
  4008ce:	54                   	push   %rsp
  4008cf:	49 c7 c0 c0 15 40 00 	mov    $0x4015c0,%r8
  4008d6:	48 c7 c1 50 15 40 00 	mov    $0x401550,%rcx
  4008dd:	48 c7 c7 11 15 40 00 	mov    $0x401511,%rdi
  4008e4:	e8 57 ff ff ff       	callq  400840 <__libc_start_main@plt>
  4008e9:	f4                   	hlt    
  4008ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004008f0 <deregister_tm_clones>:
  4008f0:	b8 97 20 60 00       	mov    $0x602097,%eax
  4008f5:	55                   	push   %rbp
  4008f6:	48 2d 90 20 60 00    	sub    $0x602090,%rax
  4008fc:	48 83 f8 0e          	cmp    $0xe,%rax
  400900:	48 89 e5             	mov    %rsp,%rbp
  400903:	77 02                	ja     400907 <deregister_tm_clones+0x17>
  400905:	5d                   	pop    %rbp
  400906:	c3                   	retq   
  400907:	b8 00 00 00 00       	mov    $0x0,%eax
  40090c:	48 85 c0             	test   %rax,%rax
  40090f:	74 f4                	je     400905 <deregister_tm_clones+0x15>
  400911:	5d                   	pop    %rbp
  400912:	bf 90 20 60 00       	mov    $0x602090,%edi
  400917:	ff e0                	jmpq   *%rax
  400919:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400920 <register_tm_clones>:
  400920:	b8 90 20 60 00       	mov    $0x602090,%eax
  400925:	55                   	push   %rbp
  400926:	48 2d 90 20 60 00    	sub    $0x602090,%rax
  40092c:	48 c1 f8 03          	sar    $0x3,%rax
  400930:	48 89 e5             	mov    %rsp,%rbp
  400933:	48 89 c2             	mov    %rax,%rdx
  400936:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40093a:	48 01 d0             	add    %rdx,%rax
  40093d:	48 d1 f8             	sar    %rax
  400940:	75 02                	jne    400944 <register_tm_clones+0x24>
  400942:	5d                   	pop    %rbp
  400943:	c3                   	retq   
  400944:	ba 00 00 00 00       	mov    $0x0,%edx
  400949:	48 85 d2             	test   %rdx,%rdx
  40094c:	74 f4                	je     400942 <register_tm_clones+0x22>
  40094e:	5d                   	pop    %rbp
  40094f:	48 89 c6             	mov    %rax,%rsi
  400952:	bf 90 20 60 00       	mov    $0x602090,%edi
  400957:	ff e2                	jmpq   *%rdx
  400959:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400960 <__do_global_dtors_aux>:
  400960:	80 3d 29 17 20 00 00 	cmpb   $0x0,0x201729(%rip)        # 602090 <__TMC_END__>
  400967:	75 11                	jne    40097a <__do_global_dtors_aux+0x1a>
  400969:	55                   	push   %rbp
  40096a:	48 89 e5             	mov    %rsp,%rbp
  40096d:	e8 7e ff ff ff       	callq  4008f0 <deregister_tm_clones>
  400972:	5d                   	pop    %rbp
  400973:	c6 05 16 17 20 00 01 	movb   $0x1,0x201716(%rip)        # 602090 <__TMC_END__>
  40097a:	f3 c3                	repz retq 
  40097c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400980 <frame_dummy>:
  400980:	48 83 3d 88 14 20 00 	cmpq   $0x0,0x201488(%rip)        # 601e10 <__JCR_END__>
  400987:	00 
  400988:	74 1e                	je     4009a8 <frame_dummy+0x28>
  40098a:	b8 00 00 00 00       	mov    $0x0,%eax
  40098f:	48 85 c0             	test   %rax,%rax
  400992:	74 14                	je     4009a8 <frame_dummy+0x28>
  400994:	55                   	push   %rbp
  400995:	bf 10 1e 60 00       	mov    $0x601e10,%edi
  40099a:	48 89 e5             	mov    %rsp,%rbp
  40099d:	ff d0                	callq  *%rax
  40099f:	5d                   	pop    %rbp
  4009a0:	e9 7b ff ff ff       	jmpq   400920 <register_tm_clones>
  4009a5:	0f 1f 00             	nopl   (%rax)
  4009a8:	e9 73 ff ff ff       	jmpq   400920 <register_tm_clones>

00000000004009ad <outputmag_>:
  4009ad:	55                   	push   %rbp
  4009ae:	48 89 e5             	mov    %rsp,%rbp
  4009b1:	41 56                	push   %r14
  4009b3:	41 55                	push   %r13
  4009b5:	41 54                	push   %r12
  4009b7:	53                   	push   %rbx
  4009b8:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  4009bf:	48 89 bd d8 fd ff ff 	mov    %rdi,-0x228(%rbp)
  4009c6:	48 89 b5 d0 fd ff ff 	mov    %rsi,-0x230(%rbp)
  4009cd:	48 89 95 c8 fd ff ff 	mov    %rdx,-0x238(%rbp)
  4009d4:	48 8b 85 c8 fd ff ff 	mov    -0x238(%rbp),%rax
  4009db:	8b 00                	mov    (%rax),%eax
  4009dd:	48 98                	cltq   
  4009df:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  4009e3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  4009e7:	ba 00 00 00 00       	mov    $0x0,%edx
  4009ec:	48 85 c0             	test   %rax,%rax
  4009ef:	48 89 d3             	mov    %rdx,%rbx
  4009f2:	48 0f 49 d8          	cmovns %rax,%rbx
  4009f6:	48 8b 85 c8 fd ff ff 	mov    -0x238(%rbp),%rax
  4009fd:	8b 00                	mov    (%rax),%eax
  4009ff:	48 98                	cltq   
  400a01:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  400a05:	48 89 d8             	mov    %rbx,%rax
  400a08:	48 0f af 45 c8       	imul   -0x38(%rbp),%rax
  400a0d:	ba 00 00 00 00       	mov    $0x0,%edx
  400a12:	48 85 c0             	test   %rax,%rax
  400a15:	48 0f 48 c2          	cmovs  %rdx,%rax
  400a19:	49 89 c0             	mov    %rax,%r8
  400a1c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  400a22:	49 89 de             	mov    %rbx,%r14
  400a25:	49 f7 d6             	not    %r14
  400a28:	48 c7 85 e8 fd ff ff 	movq   $0x4015e0,-0x218(%rbp)
  400a2f:	e0 15 40 00 
  400a33:	c7 85 f0 fd ff ff 73 	movl   $0x73,-0x210(%rbp)
  400a3a:	00 00 00 
  400a3d:	c7 85 e0 fd ff ff 80 	movl   $0x80,-0x220(%rbp)
  400a44:	00 00 00 
  400a47:	c7 85 e4 fd ff ff 06 	movl   $0x6,-0x21c(%rbp)
  400a4e:	00 00 00 
  400a51:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400a58:	48 89 c7             	mov    %rax,%rdi
  400a5b:	e8 50 fe ff ff       	callq  4008b0 <_gfortran_st_write@plt>
  400a60:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400a67:	ba 0d 00 00 00       	mov    $0xd,%edx
  400a6c:	be ea 15 40 00       	mov    $0x4015ea,%esi
  400a71:	48 89 c7             	mov    %rax,%rdi
  400a74:	e8 a7 fd ff ff       	callq  400820 <_gfortran_transfer_character_write@plt>
  400a79:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400a80:	48 89 c7             	mov    %rax,%rdi
  400a83:	e8 08 fe ff ff       	callq  400890 <_gfortran_st_write_done@plt>
  400a88:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
  400a8f:	44 8b 20             	mov    (%rax),%r12d
  400a92:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%rbp)
  400a99:	44 39 65 dc          	cmp    %r12d,-0x24(%rbp)
  400a9d:	0f 8f 18 02 00 00    	jg     400cbb <outputmag_+0x30e>
  400aa3:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
  400aaa:	44 8b 28             	mov    (%rax),%r13d
  400aad:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
  400ab4:	44 39 6d d8          	cmp    %r13d,-0x28(%rbp)
  400ab8:	0f 8f 58 01 00 00    	jg     400c16 <outputmag_+0x269>
  400abe:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400ac1:	48 98                	cltq   
  400ac3:	48 0f af c3          	imul   %rbx,%rax
  400ac7:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
  400acb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  400ace:	48 98                	cltq   
  400ad0:	48 01 c2             	add    %rax,%rdx
  400ad3:	48 8b 85 d8 fd ff ff 	mov    -0x228(%rbp),%rax
  400ada:	8b 04 90             	mov    (%rax,%rdx,4),%eax
  400add:	83 f8 01             	cmp    $0x1,%eax
  400ae0:	0f 85 8f 00 00 00    	jne    400b75 <outputmag_+0x1c8>
  400ae6:	48 c7 85 e8 fd ff ff 	movq   $0x4015e0,-0x218(%rbp)
  400aed:	e0 15 40 00 
  400af1:	c7 85 f0 fd ff ff 78 	movl   $0x78,-0x210(%rbp)
  400af8:	00 00 00 
  400afb:	48 c7 85 38 fe ff ff 	movq   $0x4015f7,-0x1c8(%rbp)
  400b02:	f7 15 40 00 
  400b06:	c7 85 34 fe ff ff 02 	movl   $0x2,-0x1cc(%rbp)
  400b0d:	00 00 00 
  400b10:	48 c7 85 28 fe ff ff 	movq   $0x4015f9,-0x1d8(%rbp)
  400b17:	f9 15 40 00 
  400b1b:	c7 85 30 fe ff ff 03 	movl   $0x3,-0x1d0(%rbp)
  400b22:	00 00 00 
  400b25:	c7 85 e0 fd ff ff 00 	movl   $0x3000,-0x220(%rbp)
  400b2c:	30 00 00 
  400b2f:	c7 85 e4 fd ff ff 06 	movl   $0x6,-0x21c(%rbp)
  400b36:	00 00 00 
  400b39:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400b40:	48 89 c7             	mov    %rax,%rdi
  400b43:	e8 68 fd ff ff       	callq  4008b0 <_gfortran_st_write@plt>
  400b48:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400b4f:	ba 03 00 00 00       	mov    $0x3,%edx
  400b54:	be fc 15 40 00       	mov    $0x4015fc,%esi
  400b59:	48 89 c7             	mov    %rax,%rdi
  400b5c:	e8 bf fc ff ff       	callq  400820 <_gfortran_transfer_character_write@plt>
  400b61:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400b68:	48 89 c7             	mov    %rax,%rdi
  400b6b:	e8 20 fd ff ff       	callq  400890 <_gfortran_st_write_done@plt>
  400b70:	e9 8a 00 00 00       	jmpq   400bff <outputmag_+0x252>
  400b75:	48 c7 85 e8 fd ff ff 	movq   $0x4015e0,-0x218(%rbp)
  400b7c:	e0 15 40 00 
  400b80:	c7 85 f0 fd ff ff 7a 	movl   $0x7a,-0x210(%rbp)
  400b87:	00 00 00 
  400b8a:	48 c7 85 38 fe ff ff 	movq   $0x4015f7,-0x1c8(%rbp)
  400b91:	f7 15 40 00 
  400b95:	c7 85 34 fe ff ff 02 	movl   $0x2,-0x1cc(%rbp)
  400b9c:	00 00 00 
  400b9f:	48 c7 85 28 fe ff ff 	movq   $0x4015f9,-0x1d8(%rbp)
  400ba6:	f9 15 40 00 
  400baa:	c7 85 30 fe ff ff 03 	movl   $0x3,-0x1d0(%rbp)
  400bb1:	00 00 00 
  400bb4:	c7 85 e0 fd ff ff 00 	movl   $0x3000,-0x220(%rbp)
  400bbb:	30 00 00 
  400bbe:	c7 85 e4 fd ff ff 06 	movl   $0x6,-0x21c(%rbp)
  400bc5:	00 00 00 
  400bc8:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400bcf:	48 89 c7             	mov    %rax,%rdi
  400bd2:	e8 d9 fc ff ff       	callq  4008b0 <_gfortran_st_write@plt>
  400bd7:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400bde:	ba 03 00 00 00       	mov    $0x3,%edx
  400be3:	be ff 15 40 00       	mov    $0x4015ff,%esi
  400be8:	48 89 c7             	mov    %rax,%rdi
  400beb:	e8 30 fc ff ff       	callq  400820 <_gfortran_transfer_character_write@plt>
  400bf0:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400bf7:	48 89 c7             	mov    %rax,%rdi
  400bfa:	e8 91 fc ff ff       	callq  400890 <_gfortran_st_write_done@plt>
  400bff:	44 39 6d d8          	cmp    %r13d,-0x28(%rbp)
  400c03:	0f 94 c0             	sete   %al
  400c06:	0f b6 c0             	movzbl %al,%eax
  400c09:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
  400c0d:	85 c0                	test   %eax,%eax
  400c0f:	75 05                	jne    400c16 <outputmag_+0x269>
  400c11:	e9 a8 fe ff ff       	jmpq   400abe <outputmag_+0x111>
  400c16:	48 c7 85 e8 fd ff ff 	movq   $0x4015e0,-0x218(%rbp)
  400c1d:	e0 15 40 00 
  400c21:	c7 85 f0 fd ff ff 7f 	movl   $0x7f,-0x210(%rbp)
  400c28:	00 00 00 
  400c2b:	c7 85 e0 fd ff ff 80 	movl   $0x80,-0x220(%rbp)
  400c32:	00 00 00 
  400c35:	c7 85 e4 fd ff ff 06 	movl   $0x6,-0x21c(%rbp)
  400c3c:	00 00 00 
  400c3f:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400c46:	48 89 c7             	mov    %rax,%rdi
  400c49:	e8 62 fc ff ff       	callq  4008b0 <_gfortran_st_write@plt>
  400c4e:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400c55:	48 89 c7             	mov    %rax,%rdi
  400c58:	e8 33 fc ff ff       	callq  400890 <_gfortran_st_write_done@plt>
  400c5d:	48 c7 85 e8 fd ff ff 	movq   $0x4015e0,-0x218(%rbp)
  400c64:	e0 15 40 00 
  400c68:	c7 85 f0 fd ff ff 80 	movl   $0x80,-0x210(%rbp)
  400c6f:	00 00 00 
  400c72:	c7 85 e0 fd ff ff 80 	movl   $0x80,-0x220(%rbp)
  400c79:	00 00 00 
  400c7c:	c7 85 e4 fd ff ff 06 	movl   $0x6,-0x21c(%rbp)
  400c83:	00 00 00 
  400c86:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400c8d:	48 89 c7             	mov    %rax,%rdi
  400c90:	e8 1b fc ff ff       	callq  4008b0 <_gfortran_st_write@plt>
  400c95:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  400c9c:	48 89 c7             	mov    %rax,%rdi
  400c9f:	e8 ec fb ff ff       	callq  400890 <_gfortran_st_write_done@plt>
  400ca4:	44 39 65 dc          	cmp    %r12d,-0x24(%rbp)
  400ca8:	0f 94 c0             	sete   %al
  400cab:	0f b6 c0             	movzbl %al,%eax
  400cae:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
  400cb2:	85 c0                	test   %eax,%eax
  400cb4:	75 05                	jne    400cbb <outputmag_+0x30e>
  400cb6:	e9 e8 fd ff ff       	jmpq   400aa3 <outputmag_+0xf6>
  400cbb:	90                   	nop
  400cbc:	48 81 c4 20 02 00 00 	add    $0x220,%rsp
  400cc3:	5b                   	pop    %rbx
  400cc4:	41 5c                	pop    %r12
  400cc6:	41 5d                	pop    %r13
  400cc8:	41 5e                	pop    %r14
  400cca:	5d                   	pop    %rbp
  400ccb:	c3                   	retq   

0000000000400ccc <calce_>:
  400ccc:	55                   	push   %rbp
  400ccd:	48 89 e5             	mov    %rsp,%rbp
  400cd0:	41 57                	push   %r15
  400cd2:	41 56                	push   %r14
  400cd4:	41 55                	push   %r13
  400cd6:	41 54                	push   %r12
  400cd8:	48 83 ec 0c          	sub    $0xc,%rsp
  400cdc:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
  400ce0:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
  400ce4:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
  400ceb:	48 89 8d 70 ff ff ff 	mov    %rcx,-0x90(%rbp)
  400cf2:	4c 89 85 68 ff ff ff 	mov    %r8,-0x98(%rbp)
  400cf9:	4c 89 8d 60 ff ff ff 	mov    %r9,-0xa0(%rbp)
  400d00:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  400d07:	8b 00                	mov    (%rax),%eax
  400d09:	48 98                	cltq   
  400d0b:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  400d0f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  400d13:	ba 00 00 00 00       	mov    $0x0,%edx
  400d18:	48 85 c0             	test   %rax,%rax
  400d1b:	48 0f 48 c2          	cmovs  %rdx,%rax
  400d1f:	49 89 c6             	mov    %rax,%r14
  400d22:	41 bf 00 00 00 00    	mov    $0x0,%r15d
  400d28:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  400d2f:	8b 00                	mov    (%rax),%eax
  400d31:	48 98                	cltq   
  400d33:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  400d37:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  400d3b:	ba 00 00 00 00       	mov    $0x0,%edx
  400d40:	48 85 c0             	test   %rax,%rax
  400d43:	48 0f 48 c2          	cmovs  %rdx,%rax
  400d47:	49 89 c4             	mov    %rax,%r12
  400d4a:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  400d50:	48 8b 45 18          	mov    0x18(%rbp),%rax
  400d54:	8b 00                	mov    (%rax),%eax
  400d56:	48 98                	cltq   
  400d58:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  400d5c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  400d60:	ba 00 00 00 00       	mov    $0x0,%edx
  400d65:	48 85 c0             	test   %rax,%rax
  400d68:	48 0f 48 c2          	cmovs  %rdx,%rax
  400d6c:	48 8b 55 18          	mov    0x18(%rbp),%rdx
  400d70:	8b 12                	mov    (%rdx),%edx
  400d72:	48 63 d2             	movslq %edx,%rdx
  400d75:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  400d79:	48 89 c2             	mov    %rax,%rdx
  400d7c:	48 0f af 55 a0       	imul   -0x60(%rbp),%rdx
  400d81:	b9 00 00 00 00       	mov    $0x0,%ecx
  400d86:	48 85 d2             	test   %rdx,%rdx
  400d89:	48 0f 48 d1          	cmovs  %rcx,%rdx
  400d8d:	49 89 d2             	mov    %rdx,%r10
  400d90:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  400d96:	48 89 c2             	mov    %rax,%rdx
  400d99:	48 f7 d2             	not    %rdx
  400d9c:	b9 00 00 00 00       	mov    $0x0,%ecx
  400da1:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
  400da5:	48 8b 4d 80          	mov    -0x80(%rbp),%rcx
  400da9:	8b 09                	mov    (%rcx),%ecx
  400dab:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  400db2:	39 4d d4             	cmp    %ecx,-0x2c(%rbp)
  400db5:	0f 8f c3 01 00 00    	jg     400f7e <calce_+0x2b2>
  400dbb:	48 8b 75 80          	mov    -0x80(%rbp),%rsi
  400dbf:	8b 36                	mov    (%rsi),%esi
  400dc1:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%rbp)
  400dc8:	39 75 cc             	cmp    %esi,-0x34(%rbp)
  400dcb:	0f 8f 95 01 00 00    	jg     400f66 <calce_+0x29a>
  400dd1:	48 8b bd 68 ff ff ff 	mov    -0x98(%rbp),%rdi
  400dd8:	8b 3f                	mov    (%rdi),%edi
  400dda:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%rbp)
  400de1:	39 7d c4             	cmp    %edi,-0x3c(%rbp)
  400de4:	0f 8f 1b 01 00 00    	jg     400f05 <calce_+0x239>
  400dea:	44 8b 45 c4          	mov    -0x3c(%rbp),%r8d
  400dee:	4d 63 c0             	movslq %r8d,%r8
  400df1:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
  400df5:	4c 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%r8
  400dfc:	47 8b 0c 88          	mov    (%r8,%r9,4),%r9d
  400e00:	44 8b 45 d4          	mov    -0x2c(%rbp),%r8d
  400e04:	45 01 c8             	add    %r9d,%r8d
  400e07:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  400e0b:	44 8b 45 c4          	mov    -0x3c(%rbp),%r8d
  400e0f:	4d 63 c0             	movslq %r8d,%r8
  400e12:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
  400e16:	4c 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%r8
  400e1d:	47 8b 0c 88          	mov    (%r8,%r9,4),%r9d
  400e21:	44 8b 45 cc          	mov    -0x34(%rbp),%r8d
  400e25:	45 01 c8             	add    %r9d,%r8d
  400e28:	44 89 45 c8          	mov    %r8d,-0x38(%rbp)
  400e2c:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  400e30:	7f 0d                	jg     400e3f <calce_+0x173>
  400e32:	4c 8b 45 80          	mov    -0x80(%rbp),%r8
  400e36:	45 8b 00             	mov    (%r8),%r8d
  400e39:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  400e3d:	eb 14                	jmp    400e53 <calce_+0x187>
  400e3f:	4c 8b 45 80          	mov    -0x80(%rbp),%r8
  400e43:	45 8b 00             	mov    (%r8),%r8d
  400e46:	44 3b 45 d0          	cmp    -0x30(%rbp),%r8d
  400e4a:	7d 07                	jge    400e53 <calce_+0x187>
  400e4c:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%rbp)
  400e53:	83 7d c8 00          	cmpl   $0x0,-0x38(%rbp)
  400e57:	7f 0d                	jg     400e66 <calce_+0x19a>
  400e59:	4c 8b 45 80          	mov    -0x80(%rbp),%r8
  400e5d:	45 8b 00             	mov    (%r8),%r8d
  400e60:	44 89 45 c8          	mov    %r8d,-0x38(%rbp)
  400e64:	eb 14                	jmp    400e7a <calce_+0x1ae>
  400e66:	4c 8b 45 80          	mov    -0x80(%rbp),%r8
  400e6a:	45 8b 00             	mov    (%r8),%r8d
  400e6d:	44 3b 45 c8          	cmp    -0x38(%rbp),%r8d
  400e71:	7d 07                	jge    400e7a <calce_+0x1ae>
  400e73:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%rbp)
  400e7a:	4c 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%r8
  400e81:	f2 41 0f 10 08       	movsd  (%r8),%xmm1
  400e86:	44 8b 45 cc          	mov    -0x34(%rbp),%r8d
  400e8a:	4d 63 c0             	movslq %r8d,%r8
  400e8d:	4c 0f af c0          	imul   %rax,%r8
  400e91:	4d 8d 0c 10          	lea    (%r8,%rdx,1),%r9
  400e95:	44 8b 45 d4          	mov    -0x2c(%rbp),%r8d
  400e99:	4d 63 c0             	movslq %r8d,%r8
  400e9c:	4d 01 c1             	add    %r8,%r9
  400e9f:	4c 8b 45 88          	mov    -0x78(%rbp),%r8
  400ea3:	47 8b 04 88          	mov    (%r8,%r9,4),%r8d
  400ea7:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
  400eac:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
  400eb0:	44 8b 45 c8          	mov    -0x38(%rbp),%r8d
  400eb4:	4d 63 c0             	movslq %r8d,%r8
  400eb7:	4c 0f af c0          	imul   %rax,%r8
  400ebb:	4d 8d 0c 10          	lea    (%r8,%rdx,1),%r9
  400ebf:	44 8b 45 d0          	mov    -0x30(%rbp),%r8d
  400ec3:	4d 63 c0             	movslq %r8d,%r8
  400ec6:	4d 01 c1             	add    %r8,%r9
  400ec9:	4c 8b 45 88          	mov    -0x78(%rbp),%r8
  400ecd:	47 8b 04 88          	mov    (%r8,%r9,4),%r8d
  400ed1:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
  400ed6:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  400eda:	f2 0f 10 4d d8       	movsd  -0x28(%rbp),%xmm1
  400edf:	f2 0f 5c c8          	subsd  %xmm0,%xmm1
  400ee3:	66 0f 28 c1          	movapd %xmm1,%xmm0
  400ee7:	f2 0f 11 45 d8       	movsd  %xmm0,-0x28(%rbp)
  400eec:	39 7d c4             	cmp    %edi,-0x3c(%rbp)
  400eef:	41 0f 94 c0          	sete   %r8b
  400ef3:	45 0f b6 c0          	movzbl %r8b,%r8d
  400ef7:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
  400efb:	45 85 c0             	test   %r8d,%r8d
  400efe:	75 05                	jne    400f05 <calce_+0x239>
  400f00:	e9 e5 fe ff ff       	jmpq   400dea <calce_+0x11e>
  400f05:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
  400f09:	f2 0f 10 07          	movsd  (%rdi),%xmm0
  400f0d:	66 0f 28 c8          	movapd %xmm0,%xmm1
  400f11:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
  400f15:	8b 7d cc             	mov    -0x34(%rbp),%edi
  400f18:	48 63 ff             	movslq %edi,%rdi
  400f1b:	48 0f af f8          	imul   %rax,%rdi
  400f1f:	4c 8d 04 17          	lea    (%rdi,%rdx,1),%r8
  400f23:	8b 7d d4             	mov    -0x2c(%rbp),%edi
  400f26:	48 63 ff             	movslq %edi,%rdi
  400f29:	49 01 f8             	add    %rdi,%r8
  400f2c:	48 8b 7d 88          	mov    -0x78(%rbp),%rdi
  400f30:	42 8b 3c 87          	mov    (%rdi,%r8,4),%edi
  400f34:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
  400f38:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  400f3c:	f2 0f 10 4d d8       	movsd  -0x28(%rbp),%xmm1
  400f41:	f2 0f 5c c8          	subsd  %xmm0,%xmm1
  400f45:	66 0f 28 c1          	movapd %xmm1,%xmm0
  400f49:	f2 0f 11 45 d8       	movsd  %xmm0,-0x28(%rbp)
  400f4e:	39 75 cc             	cmp    %esi,-0x34(%rbp)
  400f51:	40 0f 94 c7          	sete   %dil
  400f55:	40 0f b6 ff          	movzbl %dil,%edi
  400f59:	83 45 cc 01          	addl   $0x1,-0x34(%rbp)
  400f5d:	85 ff                	test   %edi,%edi
  400f5f:	75 05                	jne    400f66 <calce_+0x29a>
  400f61:	e9 6b fe ff ff       	jmpq   400dd1 <calce_+0x105>
  400f66:	39 4d d4             	cmp    %ecx,-0x2c(%rbp)
  400f69:	40 0f 94 c6          	sete   %sil
  400f6d:	40 0f b6 f6          	movzbl %sil,%esi
  400f71:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
  400f75:	85 f6                	test   %esi,%esi
  400f77:	75 05                	jne    400f7e <calce_+0x2b2>
  400f79:	e9 3d fe ff ff       	jmpq   400dbb <calce_+0xef>
  400f7e:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
  400f83:	f2 0f 10 0d 25 07 00 	movsd  0x725(%rip),%xmm1        # 4016b0 <options.33.2025+0x20>
  400f8a:	00 
  400f8b:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  400f8f:	f2 0f 11 45 d8       	movsd  %xmm0,-0x28(%rbp)
  400f94:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
  400f99:	66 0f 5a c0          	cvtpd2ps %xmm0,%xmm0
  400f9d:	f3 0f 11 45 9c       	movss  %xmm0,-0x64(%rbp)
  400fa2:	8b 45 9c             	mov    -0x64(%rbp),%eax
  400fa5:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%rbp)
  400fab:	f3 0f 10 85 5c ff ff 	movss  -0xa4(%rbp),%xmm0
  400fb2:	ff 
  400fb3:	48 83 c4 0c          	add    $0xc,%rsp
  400fb7:	41 5c                	pop    %r12
  400fb9:	41 5d                	pop    %r13
  400fbb:	41 5e                	pop    %r14
  400fbd:	41 5f                	pop    %r15
  400fbf:	5d                   	pop    %rbp
  400fc0:	c3                   	retq   

0000000000400fc1 <random_init_>:
  400fc1:	55                   	push   %rbp
  400fc2:	48 89 e5             	mov    %rsp,%rbp
  400fc5:	41 56                	push   %r14
  400fc7:	41 55                	push   %r13
  400fc9:	41 54                	push   %r12
  400fcb:	53                   	push   %rbx
  400fcc:	48 83 ec 40          	sub    $0x40,%rsp
  400fd0:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  400fd4:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  400fd8:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
  400fdc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  400fe0:	8b 00                	mov    (%rax),%eax
  400fe2:	48 98                	cltq   
  400fe4:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  400fe8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  400fec:	ba 00 00 00 00       	mov    $0x0,%edx
  400ff1:	48 85 c0             	test   %rax,%rax
  400ff4:	48 89 d3             	mov    %rdx,%rbx
  400ff7:	48 0f 49 d8          	cmovns %rax,%rbx
  400ffb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  400fff:	8b 00                	mov    (%rax),%eax
  401001:	48 98                	cltq   
  401003:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  401007:	48 89 d8             	mov    %rbx,%rax
  40100a:	48 0f af 45 c8       	imul   -0x38(%rbp),%rax
  40100f:	ba 00 00 00 00       	mov    $0x0,%edx
  401014:	48 85 c0             	test   %rax,%rax
  401017:	48 0f 48 c2          	cmovs  %rdx,%rax
  40101b:	49 89 c0             	mov    %rax,%r8
  40101e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401024:	49 89 de             	mov    %rbx,%r14
  401027:	49 f7 d6             	not    %r14
  40102a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  40102e:	44 8b 20             	mov    (%rax),%r12d
  401031:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%rbp)
  401038:	44 39 65 dc          	cmp    %r12d,-0x24(%rbp)
  40103c:	0f 8f 94 00 00 00    	jg     4010d6 <random_init_+0x115>
  401042:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  401046:	44 8b 28             	mov    (%rax),%r13d
  401049:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%rbp)
  401050:	44 39 6d d8          	cmp    %r13d,-0x28(%rbp)
  401054:	7f 69                	jg     4010bf <random_init_+0xfe>
  401056:	bf 00 00 00 00       	mov    $0x0,%edi
  40105b:	e8 00 f8 ff ff       	callq  400860 <_gfortran_rand@plt>
  401060:	0f 2e 05 51 06 00 00 	ucomiss 0x651(%rip),%xmm0        # 4016b8 <options.33.2025+0x28>
  401067:	76 22                	jbe    40108b <random_init_+0xca>
  401069:	8b 45 d8             	mov    -0x28(%rbp),%eax
  40106c:	48 98                	cltq   
  40106e:	48 0f af c3          	imul   %rbx,%rax
  401072:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
  401076:	8b 45 dc             	mov    -0x24(%rbp),%eax
  401079:	48 98                	cltq   
  40107b:	48 01 c2             	add    %rax,%rdx
  40107e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  401082:	c7 04 90 01 00 00 00 	movl   $0x1,(%rax,%rdx,4)
  401089:	eb 20                	jmp    4010ab <random_init_+0xea>
  40108b:	8b 45 d8             	mov    -0x28(%rbp),%eax
  40108e:	48 98                	cltq   
  401090:	48 0f af c3          	imul   %rbx,%rax
  401094:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
  401098:	8b 45 dc             	mov    -0x24(%rbp),%eax
  40109b:	48 98                	cltq   
  40109d:	48 01 c2             	add    %rax,%rdx
  4010a0:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4010a4:	c7 04 90 ff ff ff ff 	movl   $0xffffffff,(%rax,%rdx,4)
  4010ab:	44 39 6d d8          	cmp    %r13d,-0x28(%rbp)
  4010af:	0f 94 c0             	sete   %al
  4010b2:	0f b6 c0             	movzbl %al,%eax
  4010b5:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
  4010b9:	85 c0                	test   %eax,%eax
  4010bb:	75 02                	jne    4010bf <random_init_+0xfe>
  4010bd:	eb 97                	jmp    401056 <random_init_+0x95>
  4010bf:	44 39 65 dc          	cmp    %r12d,-0x24(%rbp)
  4010c3:	0f 94 c0             	sete   %al
  4010c6:	0f b6 c0             	movzbl %al,%eax
  4010c9:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
  4010cd:	85 c0                	test   %eax,%eax
  4010cf:	75 05                	jne    4010d6 <random_init_+0x115>
  4010d1:	e9 6c ff ff ff       	jmpq   401042 <random_init_+0x81>
  4010d6:	90                   	nop
  4010d7:	48 83 c4 40          	add    $0x40,%rsp
  4010db:	5b                   	pop    %rbx
  4010dc:	41 5c                	pop    %r12
  4010de:	41 5d                	pop    %r13
  4010e0:	41 5e                	pop    %r14
  4010e2:	5d                   	pop    %rbp
  4010e3:	c3                   	retq   

00000000004010e4 <MAIN__>:
  4010e4:	55                   	push   %rbp
  4010e5:	48 89 e5             	mov    %rsp,%rbp
  4010e8:	48 81 ec 40 29 00 00 	sub    $0x2940,%rsp
  4010ef:	48 c7 85 d8 d6 ff ff 	movq   $0x4015e0,-0x2928(%rbp)
  4010f6:	e0 15 40 00 
  4010fa:	c7 85 e0 d6 ff ff 24 	movl   $0x24,-0x2920(%rbp)
  401101:	00 00 00 
  401104:	c7 85 d0 d6 ff ff 80 	movl   $0x80,-0x2930(%rbp)
  40110b:	00 00 00 
  40110e:	c7 85 d4 d6 ff ff 06 	movl   $0x6,-0x292c(%rbp)
  401115:	00 00 00 
  401118:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  40111f:	48 89 c7             	mov    %rax,%rdi
  401122:	e8 89 f7 ff ff       	callq  4008b0 <_gfortran_st_write@plt>
  401127:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  40112e:	ba 0c 00 00 00       	mov    $0xc,%edx
  401133:	be 02 16 40 00       	mov    $0x401602,%esi
  401138:	48 89 c7             	mov    %rax,%rdi
  40113b:	e8 e0 f6 ff ff       	callq  400820 <_gfortran_transfer_character_write@plt>
  401140:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  401147:	48 89 c7             	mov    %rax,%rdi
  40114a:	e8 41 f7 ff ff       	callq  400890 <_gfortran_st_write_done@plt>
  40114f:	48 c7 85 d8 d6 ff ff 	movq   $0x4015e0,-0x2928(%rbp)
  401156:	e0 15 40 00 
  40115a:	c7 85 e0 d6 ff ff 25 	movl   $0x25,-0x2920(%rbp)
  401161:	00 00 00 
  401164:	c7 85 d0 d6 ff ff 80 	movl   $0x80,-0x2930(%rbp)
  40116b:	00 00 00 
  40116e:	c7 85 d4 d6 ff ff 05 	movl   $0x5,-0x292c(%rbp)
  401175:	00 00 00 
  401178:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  40117f:	48 89 c7             	mov    %rax,%rdi
  401182:	e8 69 f6 ff ff       	callq  4007f0 <_gfortran_st_read@plt>
  401187:	48 8d 8d c0 d8 ff ff 	lea    -0x2740(%rbp),%rcx
  40118e:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  401195:	ba 08 00 00 00       	mov    $0x8,%edx
  40119a:	48 89 ce             	mov    %rcx,%rsi
  40119d:	48 89 c7             	mov    %rax,%rdi
  4011a0:	e8 8b f6 ff ff       	callq  400830 <_gfortran_transfer_real@plt>
  4011a5:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4011ac:	48 89 c7             	mov    %rax,%rdi
  4011af:	e8 4c f6 ff ff       	callq  400800 <_gfortran_st_read_done@plt>
  4011b4:	f2 0f 10 8d c0 d8 ff 	movsd  -0x2740(%rbp),%xmm1
  4011bb:	ff 
  4011bc:	f2 0f 10 05 fc 04 00 	movsd  0x4fc(%rip),%xmm0        # 4016c0 <options.33.2025+0x30>
  4011c3:	00 
  4011c4:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  4011c8:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
  4011cd:	48 c7 85 d8 d6 ff ff 	movq   $0x4015e0,-0x2928(%rbp)
  4011d4:	e0 15 40 00 
  4011d8:	c7 85 e0 d6 ff ff 28 	movl   $0x28,-0x2920(%rbp)
  4011df:	00 00 00 
  4011e2:	c7 85 d0 d6 ff ff 80 	movl   $0x80,-0x2930(%rbp)
  4011e9:	00 00 00 
  4011ec:	c7 85 d4 d6 ff ff 06 	movl   $0x6,-0x292c(%rbp)
  4011f3:	00 00 00 
  4011f6:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4011fd:	48 89 c7             	mov    %rax,%rdi
  401200:	e8 ab f6 ff ff       	callq  4008b0 <_gfortran_st_write@plt>
  401205:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  40120c:	ba 17 00 00 00       	mov    $0x17,%edx
  401211:	be 0e 16 40 00       	mov    $0x40160e,%esi
  401216:	48 89 c7             	mov    %rax,%rdi
  401219:	e8 02 f6 ff ff       	callq  400820 <_gfortran_transfer_character_write@plt>
  40121e:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  401225:	48 89 c7             	mov    %rax,%rdi
  401228:	e8 63 f6 ff ff       	callq  400890 <_gfortran_st_write_done@plt>
  40122d:	48 c7 85 d8 d6 ff ff 	movq   $0x4015e0,-0x2928(%rbp)
  401234:	e0 15 40 00 
  401238:	c7 85 e0 d6 ff ff 29 	movl   $0x29,-0x2920(%rbp)
  40123f:	00 00 00 
  401242:	c7 85 d0 d6 ff ff 80 	movl   $0x80,-0x2930(%rbp)
  401249:	00 00 00 
  40124c:	c7 85 d4 d6 ff ff 05 	movl   $0x5,-0x292c(%rbp)
  401253:	00 00 00 
  401256:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  40125d:	48 89 c7             	mov    %rax,%rdi
  401260:	e8 8b f5 ff ff       	callq  4007f0 <_gfortran_st_read@plt>
  401265:	48 8d 4d ec          	lea    -0x14(%rbp),%rcx
  401269:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  401270:	ba 04 00 00 00       	mov    $0x4,%edx
  401275:	48 89 ce             	mov    %rcx,%rsi
  401278:	48 89 c7             	mov    %rax,%rdi
  40127b:	e8 00 f6 ff ff       	callq  400880 <_gfortran_transfer_integer@plt>
  401280:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  401287:	48 89 c7             	mov    %rax,%rdi
  40128a:	e8 71 f5 ff ff       	callq  400800 <_gfortran_st_read_done@plt>
  40128f:	48 c7 85 d8 d6 ff ff 	movq   $0x4015e0,-0x2928(%rbp)
  401296:	e0 15 40 00 
  40129a:	c7 85 e0 d6 ff ff 2b 	movl   $0x2b,-0x2920(%rbp)
  4012a1:	00 00 00 
  4012a4:	c7 85 d0 d6 ff ff 80 	movl   $0x80,-0x2930(%rbp)
  4012ab:	00 00 00 
  4012ae:	c7 85 d4 d6 ff ff 06 	movl   $0x6,-0x292c(%rbp)
  4012b5:	00 00 00 
  4012b8:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4012bf:	48 89 c7             	mov    %rax,%rdi
  4012c2:	e8 e9 f5 ff ff       	callq  4008b0 <_gfortran_st_write@plt>
  4012c7:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4012ce:	ba 0a 00 00 00       	mov    $0xa,%edx
  4012d3:	be 25 16 40 00       	mov    $0x401625,%esi
  4012d8:	48 89 c7             	mov    %rax,%rdi
  4012db:	e8 40 f5 ff ff       	callq  400820 <_gfortran_transfer_character_write@plt>
  4012e0:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4012e7:	48 89 c7             	mov    %rax,%rdi
  4012ea:	e8 a1 f5 ff ff       	callq  400890 <_gfortran_st_write_done@plt>
  4012ef:	48 c7 85 d8 d6 ff ff 	movq   $0x4015e0,-0x2928(%rbp)
  4012f6:	e0 15 40 00 
  4012fa:	c7 85 e0 d6 ff ff 2c 	movl   $0x2c,-0x2920(%rbp)
  401301:	00 00 00 
  401304:	c7 85 d0 d6 ff ff 80 	movl   $0x80,-0x2930(%rbp)
  40130b:	00 00 00 
  40130e:	c7 85 d4 d6 ff ff 05 	movl   $0x5,-0x292c(%rbp)
  401315:	00 00 00 
  401318:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  40131f:	48 89 c7             	mov    %rax,%rdi
  401322:	e8 c9 f4 ff ff       	callq  4007f0 <_gfortran_st_read@plt>
  401327:	48 8d 8d cc d8 ff ff 	lea    -0x2734(%rbp),%rcx
  40132e:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  401335:	ba 04 00 00 00       	mov    $0x4,%edx
  40133a:	48 89 ce             	mov    %rcx,%rsi
  40133d:	48 89 c7             	mov    %rax,%rdi
  401340:	e8 3b f5 ff ff       	callq  400880 <_gfortran_transfer_integer@plt>
  401345:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  40134c:	48 89 c7             	mov    %rax,%rdi
  40134f:	e8 ac f4 ff ff       	callq  400800 <_gfortran_st_read_done@plt>
  401354:	48 c7 85 d8 d6 ff ff 	movq   $0x4015e0,-0x2928(%rbp)
  40135b:	e0 15 40 00 
  40135f:	c7 85 e0 d6 ff ff 2e 	movl   $0x2e,-0x2920(%rbp)
  401366:	00 00 00 
  401369:	c7 85 d0 d6 ff ff 80 	movl   $0x80,-0x2930(%rbp)
  401370:	00 00 00 
  401373:	c7 85 d4 d6 ff ff 06 	movl   $0x6,-0x292c(%rbp)
  40137a:	00 00 00 
  40137d:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  401384:	48 89 c7             	mov    %rax,%rdi
  401387:	e8 24 f5 ff ff       	callq  4008b0 <_gfortran_st_write@plt>
  40138c:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  401393:	ba 11 00 00 00       	mov    $0x11,%edx
  401398:	be 2f 16 40 00       	mov    $0x40162f,%esi
  40139d:	48 89 c7             	mov    %rax,%rdi
  4013a0:	e8 7b f4 ff ff       	callq  400820 <_gfortran_transfer_character_write@plt>
  4013a5:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4013ac:	48 89 c7             	mov    %rax,%rdi
  4013af:	e8 dc f4 ff ff       	callq  400890 <_gfortran_st_write_done@plt>
  4013b4:	48 c7 85 d8 d6 ff ff 	movq   $0x4015e0,-0x2928(%rbp)
  4013bb:	e0 15 40 00 
  4013bf:	c7 85 e0 d6 ff ff 2f 	movl   $0x2f,-0x2920(%rbp)
  4013c6:	00 00 00 
  4013c9:	c7 85 d0 d6 ff ff 80 	movl   $0x80,-0x2930(%rbp)
  4013d0:	00 00 00 
  4013d3:	c7 85 d4 d6 ff ff 05 	movl   $0x5,-0x292c(%rbp)
  4013da:	00 00 00 
  4013dd:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4013e4:	48 89 c7             	mov    %rax,%rdi
  4013e7:	e8 04 f4 ff ff       	callq  4007f0 <_gfortran_st_read@plt>
  4013ec:	48 8d 8d bc d8 ff ff 	lea    -0x2744(%rbp),%rcx
  4013f3:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4013fa:	ba 04 00 00 00       	mov    $0x4,%edx
  4013ff:	48 89 ce             	mov    %rcx,%rsi
  401402:	48 89 c7             	mov    %rax,%rdi
  401405:	e8 76 f4 ff ff       	callq  400880 <_gfortran_transfer_integer@plt>
  40140a:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  401411:	48 89 c7             	mov    %rax,%rdi
  401414:	e8 e7 f3 ff ff       	callq  400800 <_gfortran_st_read_done@plt>
  401419:	48 8d 4d ec          	lea    -0x14(%rbp),%rcx
  40141d:	48 8d 85 d0 d8 ff ff 	lea    -0x2730(%rbp),%rax
  401424:	ba 40 16 40 00       	mov    $0x401640,%edx
  401429:	48 89 ce             	mov    %rcx,%rsi
  40142c:	48 89 c7             	mov    %rax,%rdi
  40142f:	e8 8d fb ff ff       	callq  400fc1 <random_init_>
  401434:	48 8d 75 ec          	lea    -0x14(%rbp),%rsi
  401438:	48 8d 85 d0 d8 ff ff 	lea    -0x2730(%rbp),%rax
  40143f:	48 c7 44 24 08 40 16 	movq   $0x401640,0x8(%rsp)
  401446:	40 00 
  401448:	48 c7 04 24 58 16 40 	movq   $0x401658,(%rsp)
  40144f:	00 
  401450:	41 b9 48 16 40 00    	mov    $0x401648,%r9d
  401456:	41 b8 50 16 40 00    	mov    $0x401650,%r8d
  40145c:	b9 80 16 40 00       	mov    $0x401680,%ecx
  401461:	ba 70 16 40 00       	mov    $0x401670,%edx
  401466:	48 89 c7             	mov    %rax,%rdi
  401469:	e8 5e f8 ff ff       	callq  400ccc <calce_>
  40146e:	0f 14 c0             	unpcklps %xmm0,%xmm0
  401471:	0f 5a c0             	cvtps2pd %xmm0,%xmm0
  401474:	f2 0f 11 45 f0       	movsd  %xmm0,-0x10(%rbp)
  401479:	48 8d 4d ec          	lea    -0x14(%rbp),%rcx
  40147d:	48 8d 85 d0 d8 ff ff 	lea    -0x2730(%rbp),%rax
  401484:	ba 40 16 40 00       	mov    $0x401640,%edx
  401489:	48 89 ce             	mov    %rcx,%rsi
  40148c:	48 89 c7             	mov    %rax,%rdi
  40148f:	e8 19 f5 ff ff       	callq  4009ad <outputmag_>
  401494:	48 c7 85 d8 d6 ff ff 	movq   $0x4015e0,-0x2928(%rbp)
  40149b:	e0 15 40 00 
  40149f:	c7 85 e0 d6 ff ff 50 	movl   $0x50,-0x2920(%rbp)
  4014a6:	00 00 00 
  4014a9:	c7 85 d0 d6 ff ff 80 	movl   $0x80,-0x2930(%rbp)
  4014b0:	00 00 00 
  4014b3:	c7 85 d4 d6 ff ff 06 	movl   $0x6,-0x292c(%rbp)
  4014ba:	00 00 00 
  4014bd:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4014c4:	48 89 c7             	mov    %rax,%rdi
  4014c7:	e8 e4 f3 ff ff       	callq  4008b0 <_gfortran_st_write@plt>
  4014cc:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4014d3:	ba 0e 00 00 00       	mov    $0xe,%edx
  4014d8:	be 60 16 40 00       	mov    $0x401660,%esi
  4014dd:	48 89 c7             	mov    %rax,%rdi
  4014e0:	e8 3b f3 ff ff       	callq  400820 <_gfortran_transfer_character_write@plt>
  4014e5:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
  4014e9:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  4014f0:	ba 08 00 00 00       	mov    $0x8,%edx
  4014f5:	48 89 ce             	mov    %rcx,%rsi
  4014f8:	48 89 c7             	mov    %rax,%rdi
  4014fb:	e8 70 f3 ff ff       	callq  400870 <_gfortran_transfer_real_write@plt>
  401500:	48 8d 85 d0 d6 ff ff 	lea    -0x2930(%rbp),%rax
  401507:	48 89 c7             	mov    %rax,%rdi
  40150a:	e8 81 f3 ff ff       	callq  400890 <_gfortran_st_write_done@plt>
  40150f:	c9                   	leaveq 
  401510:	c3                   	retq   

0000000000401511 <main>:
  401511:	55                   	push   %rbp
  401512:	48 89 e5             	mov    %rsp,%rbp
  401515:	48 83 ec 10          	sub    $0x10,%rsp
  401519:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40151c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  401520:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  401524:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401527:	48 89 d6             	mov    %rdx,%rsi
  40152a:	89 c7                	mov    %eax,%edi
  40152c:	e8 6f f3 ff ff       	callq  4008a0 <_gfortran_set_args@plt>
  401531:	be 90 16 40 00       	mov    $0x401690,%esi
  401536:	bf 07 00 00 00       	mov    $0x7,%edi
  40153b:	e8 d0 f2 ff ff       	callq  400810 <_gfortran_set_options@plt>
  401540:	e8 9f fb ff ff       	callq  4010e4 <MAIN__>
  401545:	b8 00 00 00 00       	mov    $0x0,%eax
  40154a:	c9                   	leaveq 
  40154b:	c3                   	retq   
  40154c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401550 <__libc_csu_init>:
  401550:	41 57                	push   %r15
  401552:	41 89 ff             	mov    %edi,%r15d
  401555:	41 56                	push   %r14
  401557:	49 89 f6             	mov    %rsi,%r14
  40155a:	41 55                	push   %r13
  40155c:	49 89 d5             	mov    %rdx,%r13
  40155f:	41 54                	push   %r12
  401561:	4c 8d 25 98 08 20 00 	lea    0x200898(%rip),%r12        # 601e00 <__frame_dummy_init_array_entry>
  401568:	55                   	push   %rbp
  401569:	48 8d 2d 98 08 20 00 	lea    0x200898(%rip),%rbp        # 601e08 <__init_array_end>
  401570:	53                   	push   %rbx
  401571:	4c 29 e5             	sub    %r12,%rbp
  401574:	31 db                	xor    %ebx,%ebx
  401576:	48 c1 fd 03          	sar    $0x3,%rbp
  40157a:	48 83 ec 08          	sub    $0x8,%rsp
  40157e:	e8 3d f2 ff ff       	callq  4007c0 <_init>
  401583:	48 85 ed             	test   %rbp,%rbp
  401586:	74 1e                	je     4015a6 <__libc_csu_init+0x56>
  401588:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40158f:	00 
  401590:	4c 89 ea             	mov    %r13,%rdx
  401593:	4c 89 f6             	mov    %r14,%rsi
  401596:	44 89 ff             	mov    %r15d,%edi
  401599:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40159d:	48 83 c3 01          	add    $0x1,%rbx
  4015a1:	48 39 eb             	cmp    %rbp,%rbx
  4015a4:	75 ea                	jne    401590 <__libc_csu_init+0x40>
  4015a6:	48 83 c4 08          	add    $0x8,%rsp
  4015aa:	5b                   	pop    %rbx
  4015ab:	5d                   	pop    %rbp
  4015ac:	41 5c                	pop    %r12
  4015ae:	41 5d                	pop    %r13
  4015b0:	41 5e                	pop    %r14
  4015b2:	41 5f                	pop    %r15
  4015b4:	c3                   	retq   
  4015b5:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  4015bc:	00 00 00 00 

00000000004015c0 <__libc_csu_fini>:
  4015c0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000004015c4 <_fini>:
  4015c4:	48 83 ec 08          	sub    $0x8,%rsp
  4015c8:	48 83 c4 08          	add    $0x8,%rsp
  4015cc:	c3                   	retq   
