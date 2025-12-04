VerifyPIN/VerifyPIN_7_HB+FTL+INL+DPTC+DT+SC/bin/verifypin_7:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 c1 2f 00 00 	mov    0x2fc1(%rip),%rax        # 3fd0 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <printf@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <printf@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <printf@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .text:

0000000000001040 <_start>:
    1040:	f3 0f 1e fa          	endbr64
    1044:	31 ed                	xor    %ebp,%ebp
    1046:	49 89 d1             	mov    %rdx,%r9
    1049:	5e                   	pop    %rsi
    104a:	48 89 e2             	mov    %rsp,%rdx
    104d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1051:	50                   	push   %rax
    1052:	54                   	push   %rsp
    1053:	45 31 c0             	xor    %r8d,%r8d
    1056:	31 c9                	xor    %ecx,%ecx
    1058:	48 8d 3d a1 03 00 00 	lea    0x3a1(%rip),%rdi        # 1400 <main>
    105f:	ff 15 5b 2f 00 00    	call   *0x2f5b(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1065:	f4                   	hlt
    1066:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    106d:	00 00 00 
    1070:	48 8d 3d a1 2f 00 00 	lea    0x2fa1(%rip),%rdi        # 4018 <__TMC_END__>
    1077:	48 8d 05 9a 2f 00 00 	lea    0x2f9a(%rip),%rax        # 4018 <__TMC_END__>
    107e:	48 39 f8             	cmp    %rdi,%rax
    1081:	74 15                	je     1098 <_start+0x58>
    1083:	48 8b 05 3e 2f 00 00 	mov    0x2f3e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    108a:	48 85 c0             	test   %rax,%rax
    108d:	74 09                	je     1098 <_start+0x58>
    108f:	ff e0                	jmp    *%rax
    1091:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1098:	c3                   	ret
    1099:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10a0:	48 8d 3d 71 2f 00 00 	lea    0x2f71(%rip),%rdi        # 4018 <__TMC_END__>
    10a7:	48 8d 35 6a 2f 00 00 	lea    0x2f6a(%rip),%rsi        # 4018 <__TMC_END__>
    10ae:	48 29 fe             	sub    %rdi,%rsi
    10b1:	48 89 f0             	mov    %rsi,%rax
    10b4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10b8:	48 c1 f8 03          	sar    $0x3,%rax
    10bc:	48 01 c6             	add    %rax,%rsi
    10bf:	48 d1 fe             	sar    $1,%rsi
    10c2:	74 14                	je     10d8 <_start+0x98>
    10c4:	48 8b 05 0d 2f 00 00 	mov    0x2f0d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10cb:	48 85 c0             	test   %rax,%rax
    10ce:	74 08                	je     10d8 <_start+0x98>
    10d0:	ff e0                	jmp    *%rax
    10d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10d8:	c3                   	ret
    10d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10e0:	f3 0f 1e fa          	endbr64
    10e4:	80 3d 2d 2f 00 00 00 	cmpb   $0x0,0x2f2d(%rip)        # 4018 <__TMC_END__>
    10eb:	75 33                	jne    1120 <_start+0xe0>
    10ed:	55                   	push   %rbp
    10ee:	48 83 3d ea 2e 00 00 	cmpq   $0x0,0x2eea(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    10f5:	00 
    10f6:	48 89 e5             	mov    %rsp,%rbp
    10f9:	74 0d                	je     1108 <_start+0xc8>
    10fb:	48 8b 3d 0e 2f 00 00 	mov    0x2f0e(%rip),%rdi        # 4010 <__dso_handle>
    1102:	ff 15 d8 2e 00 00    	call   *0x2ed8(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1108:	e8 63 ff ff ff       	call   1070 <_start+0x30>
    110d:	c6 05 04 2f 00 00 01 	movb   $0x1,0x2f04(%rip)        # 4018 <__TMC_END__>
    1114:	5d                   	pop    %rbp
    1115:	c3                   	ret
    1116:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    111d:	00 00 00 
    1120:	c3                   	ret
    1121:	0f 1f 40 00          	nopl   0x0(%rax)
    1125:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    112c:	00 00 00 00 
    1130:	f3 0f 1e fa          	endbr64
    1134:	e9 67 ff ff ff       	jmp    10a0 <_start+0x60>
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <countermeasure>:
    1140:	55                   	push   %rbp
    1141:	48 89 e5             	mov    %rsp,%rbp
    1144:	48 8d 05 d0 2e 00 00 	lea    0x2ed0(%rip),%rax        # 401b <g_countermeasure>
    114b:	c6 00 01             	movb   $0x1,(%rax)
    114e:	5d                   	pop    %rbp
    114f:	c3                   	ret

0000000000001150 <initialize>:
    1150:	55                   	push   %rbp
    1151:	48 89 e5             	mov    %rsp,%rbp
    1154:	c6 05 be 2e 00 00 55 	movb   $0x55,0x2ebe(%rip)        # 4019 <g_authenticated>
    115b:	c6 05 b8 2e 00 00 03 	movb   $0x3,0x2eb8(%rip)        # 401a <g_ptc>
    1162:	c6 05 b2 2e 00 00 00 	movb   $0x0,0x2eb2(%rip)        # 401b <g_countermeasure>
    1169:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1170:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
    1174:	7d 21                	jge    1197 <initialize+0x47>
    1176:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1179:	83 c0 01             	add    $0x1,%eax
    117c:	88 c2                	mov    %al,%dl
    117e:	48 63 4d fc          	movslq -0x4(%rbp),%rcx
    1182:	48 8d 05 93 2e 00 00 	lea    0x2e93(%rip),%rax        # 401c <g_cardPin>
    1189:	88 14 08             	mov    %dl,(%rax,%rcx,1)
    118c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    118f:	83 c0 01             	add    $0x1,%eax
    1192:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1195:	eb d9                	jmp    1170 <initialize+0x20>
    1197:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    119e:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
    11a2:	7d 1a                	jge    11be <initialize+0x6e>
    11a4:	48 63 4d fc          	movslq -0x4(%rbp),%rcx
    11a8:	48 8d 05 71 2e 00 00 	lea    0x2e71(%rip),%rax        # 4020 <g_userPin>
    11af:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    11b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11b6:	83 c0 01             	add    $0x1,%eax
    11b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    11bc:	eb e0                	jmp    119e <initialize+0x4e>
    11be:	5d                   	pop    %rbp
    11bf:	c3                   	ret

00000000000011c0 <oracle>:
    11c0:	55                   	push   %rbp
    11c1:	48 89 e5             	mov    %rsp,%rbp
    11c4:	48 8d 05 50 2e 00 00 	lea    0x2e50(%rip),%rax        # 401b <g_countermeasure>
    11cb:	0f b6 08             	movzbl (%rax),%ecx
    11ce:	31 c0                	xor    %eax,%eax
    11d0:	83 f9 01             	cmp    $0x1,%ecx
    11d3:	88 45 ff             	mov    %al,-0x1(%rbp)
    11d6:	74 15                	je     11ed <oracle+0x2d>
    11d8:	48 8d 05 3a 2e 00 00 	lea    0x2e3a(%rip),%rax        # 4019 <g_authenticated>
    11df:	0f b6 00             	movzbl (%rax),%eax
    11e2:	3d aa 00 00 00       	cmp    $0xaa,%eax
    11e7:	0f 94 c0             	sete   %al
    11ea:	88 45 ff             	mov    %al,-0x1(%rbp)
    11ed:	8a 45 ff             	mov    -0x1(%rbp),%al
    11f0:	24 01                	and    $0x1,%al
    11f2:	0f b6 c0             	movzbl %al,%eax
    11f5:	5d                   	pop    %rbp
    11f6:	c3                   	ret
    11f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    11fe:	00 00 

0000000000001200 <oracle_ptc>:
    1200:	55                   	push   %rbp
    1201:	48 89 e5             	mov    %rsp,%rbp
    1204:	48 8d 05 10 2e 00 00 	lea    0x2e10(%rip),%rax        # 401b <g_countermeasure>
    120b:	0f b6 08             	movzbl (%rax),%ecx
    120e:	31 c0                	xor    %eax,%eax
    1210:	83 f9 01             	cmp    $0x1,%ecx
    1213:	88 45 ff             	mov    %al,-0x1(%rbp)
    1216:	74 13                	je     122b <oracle_ptc+0x2b>
    1218:	48 8d 05 fb 2d 00 00 	lea    0x2dfb(%rip),%rax        # 401a <g_ptc>
    121f:	0f be 00             	movsbl (%rax),%eax
    1222:	83 f8 03             	cmp    $0x3,%eax
    1225:	0f 9d c0             	setge  %al
    1228:	88 45 ff             	mov    %al,-0x1(%rbp)
    122b:	8a 45 ff             	mov    -0x1(%rbp),%al
    122e:	24 01                	and    $0x1,%al
    1230:	0f b6 c0             	movzbl %al,%eax
    1233:	5d                   	pop    %rbp
    1234:	c3                   	ret
    1235:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    123c:	00 00 00 
    123f:	90                   	nop

0000000000001240 <verifyPIN>:
    1240:	55                   	push   %rbp
    1241:	48 89 e5             	mov    %rsp,%rbp
    1244:	48 83 ec 10          	sub    $0x10,%rsp
    1248:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    124f:	48 8d 05 c3 2d 00 00 	lea    0x2dc3(%rip),%rax        # 4019 <g_authenticated>
    1256:	c6 00 55             	movb   $0x55,(%rax)
    1259:	48 8d 05 ba 2d 00 00 	lea    0x2dba(%rip),%rax        # 401a <g_ptc>
    1260:	0f be 00             	movsbl (%rax),%eax
    1263:	83 f8 00             	cmp    $0x0,%eax
    1266:	0f 8e 85 01 00 00    	jle    13f1 <verifyPIN+0x1b1>
    126c:	8b 45 f8             	mov    -0x8(%rbp),%eax
    126f:	83 c0 01             	add    $0x1,%eax
    1272:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1275:	83 7d f8 01          	cmpl   $0x1,-0x8(%rbp)
    1279:	74 05                	je     1280 <verifyPIN+0x40>
    127b:	e8 c0 fe ff ff       	call   1140 <countermeasure>
    1280:	48 8d 05 93 2d 00 00 	lea    0x2d93(%rip),%rax        # 401a <g_ptc>
    1287:	8a 08                	mov    (%rax),%cl
    1289:	80 c1 ff             	add    $0xff,%cl
    128c:	48 8d 05 87 2d 00 00 	lea    0x2d87(%rip),%rax        # 401a <g_ptc>
    1293:	88 08                	mov    %cl,(%rax)
    1295:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1298:	83 c0 01             	add    $0x1,%eax
    129b:	89 45 f8             	mov    %eax,-0x8(%rbp)
    129e:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
    12a2:	74 05                	je     12a9 <verifyPIN+0x69>
    12a4:	e8 97 fe ff ff       	call   1140 <countermeasure>
    12a9:	c6 45 f3 55          	movb   $0x55,-0xd(%rbp)
    12ad:	c6 45 f2 55          	movb   $0x55,-0xe(%rbp)
    12b1:	8b 45 f8             	mov    -0x8(%rbp),%eax
    12b4:	83 c0 01             	add    $0x1,%eax
    12b7:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12ba:	83 7d f8 03          	cmpl   $0x3,-0x8(%rbp)
    12be:	74 05                	je     12c5 <verifyPIN+0x85>
    12c0:	e8 7b fe ff ff       	call   1140 <countermeasure>
    12c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    12cc:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
    12d0:	7d 4e                	jge    1320 <verifyPIN+0xe0>
    12d2:	48 63 4d f4          	movslq -0xc(%rbp),%rcx
    12d6:	48 8d 05 43 2d 00 00 	lea    0x2d43(%rip),%rax        # 4020 <g_userPin>
    12dd:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
    12e1:	48 63 55 f4          	movslq -0xc(%rbp),%rdx
    12e5:	48 8d 0d 30 2d 00 00 	lea    0x2d30(%rip),%rcx        # 401c <g_cardPin>
    12ec:	0f b6 0c 11          	movzbl (%rcx,%rdx,1),%ecx
    12f0:	39 c8                	cmp    %ecx,%eax
    12f2:	74 04                	je     12f8 <verifyPIN+0xb8>
    12f4:	c6 45 f2 aa          	movb   $0xaa,-0xe(%rbp)
    12f8:	8b 45 f8             	mov    -0x8(%rbp),%eax
    12fb:	83 c0 01             	add    $0x1,%eax
    12fe:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1301:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1304:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    1307:	83 c1 04             	add    $0x4,%ecx
    130a:	39 c8                	cmp    %ecx,%eax
    130c:	74 05                	je     1313 <verifyPIN+0xd3>
    130e:	e8 2d fe ff ff       	call   1140 <countermeasure>
    1313:	eb 00                	jmp    1315 <verifyPIN+0xd5>
    1315:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1318:	83 c0 01             	add    $0x1,%eax
    131b:	89 45 f4             	mov    %eax,-0xc(%rbp)
    131e:	eb ac                	jmp    12cc <verifyPIN+0x8c>
    1320:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1323:	83 c0 01             	add    $0x1,%eax
    1326:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1329:	83 7d f8 08          	cmpl   $0x8,-0x8(%rbp)
    132d:	74 05                	je     1334 <verifyPIN+0xf4>
    132f:	e8 0c fe ff ff       	call   1140 <countermeasure>
    1334:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
    1338:	74 05                	je     133f <verifyPIN+0xff>
    133a:	e8 01 fe ff ff       	call   1140 <countermeasure>
    133f:	0f b6 45 f2          	movzbl -0xe(%rbp),%eax
    1343:	83 f8 55             	cmp    $0x55,%eax
    1346:	75 1a                	jne    1362 <verifyPIN+0x122>
    1348:	0f b6 4d f2          	movzbl -0xe(%rbp),%ecx
    134c:	b8 55 00 00 00       	mov    $0x55,%eax
    1351:	39 c8                	cmp    %ecx,%eax
    1353:	75 06                	jne    135b <verifyPIN+0x11b>
    1355:	c6 45 f3 aa          	movb   $0xaa,-0xd(%rbp)
    1359:	eb 05                	jmp    1360 <verifyPIN+0x120>
    135b:	e8 e0 fd ff ff       	call   1140 <countermeasure>
    1360:	eb 04                	jmp    1366 <verifyPIN+0x126>
    1362:	c6 45 f3 55          	movb   $0x55,-0xd(%rbp)
    1366:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1369:	83 c0 01             	add    $0x1,%eax
    136c:	89 45 f8             	mov    %eax,-0x8(%rbp)
    136f:	83 7d f8 09          	cmpl   $0x9,-0x8(%rbp)
    1373:	74 05                	je     137a <verifyPIN+0x13a>
    1375:	e8 c6 fd ff ff       	call   1140 <countermeasure>
    137a:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
    137e:	3d aa 00 00 00       	cmp    $0xaa,%eax
    1383:	75 6a                	jne    13ef <verifyPIN+0x1af>
    1385:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1388:	83 c0 01             	add    $0x1,%eax
    138b:	89 45 f8             	mov    %eax,-0x8(%rbp)
    138e:	83 7d f8 0a          	cmpl   $0xa,-0x8(%rbp)
    1392:	74 05                	je     1399 <verifyPIN+0x159>
    1394:	e8 a7 fd ff ff       	call   1140 <countermeasure>
    1399:	0f b6 4d f3          	movzbl -0xd(%rbp),%ecx
    139d:	b8 aa 00 00 00       	mov    $0xaa,%eax
    13a2:	39 c8                	cmp    %ecx,%eax
    13a4:	75 42                	jne    13e8 <verifyPIN+0x1a8>
    13a6:	8b 45 f8             	mov    -0x8(%rbp),%eax
    13a9:	83 c0 01             	add    $0x1,%eax
    13ac:	89 45 f8             	mov    %eax,-0x8(%rbp)
    13af:	83 7d f8 0b          	cmpl   $0xb,-0x8(%rbp)
    13b3:	74 05                	je     13ba <verifyPIN+0x17a>
    13b5:	e8 86 fd ff ff       	call   1140 <countermeasure>
    13ba:	48 8d 05 59 2c 00 00 	lea    0x2c59(%rip),%rax        # 401a <g_ptc>
    13c1:	c6 00 03             	movb   $0x3,(%rax)
    13c4:	8b 45 f8             	mov    -0x8(%rbp),%eax
    13c7:	83 c0 01             	add    $0x1,%eax
    13ca:	89 45 f8             	mov    %eax,-0x8(%rbp)
    13cd:	83 7d f8 0c          	cmpl   $0xc,-0x8(%rbp)
    13d1:	74 05                	je     13d8 <verifyPIN+0x198>
    13d3:	e8 68 fd ff ff       	call   1140 <countermeasure>
    13d8:	48 8d 05 3a 2c 00 00 	lea    0x2c3a(%rip),%rax        # 4019 <g_authenticated>
    13df:	c6 00 aa             	movb   $0xaa,(%rax)
    13e2:	c6 45 ff aa          	movb   $0xaa,-0x1(%rbp)
    13e6:	eb 0d                	jmp    13f5 <verifyPIN+0x1b5>
    13e8:	e8 53 fd ff ff       	call   1140 <countermeasure>
    13ed:	eb 00                	jmp    13ef <verifyPIN+0x1af>
    13ef:	eb 00                	jmp    13f1 <verifyPIN+0x1b1>
    13f1:	c6 45 ff 55          	movb   $0x55,-0x1(%rbp)
    13f5:	8a 45 ff             	mov    -0x1(%rbp),%al
    13f8:	48 83 c4 10          	add    $0x10,%rsp
    13fc:	5d                   	pop    %rbp
    13fd:	c3                   	ret
    13fe:	66 90                	xchg   %ax,%ax

0000000000001400 <main>:
    1400:	55                   	push   %rbp
    1401:	48 89 e5             	mov    %rsp,%rbp
    1404:	48 83 ec 10          	sub    $0x10,%rsp
    1408:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    140f:	e8 3c fd ff ff       	call   1150 <initialize>
    1414:	e8 27 fe ff ff       	call   1240 <verifyPIN>
    1419:	48 8d 05 fb 2b 00 00 	lea    0x2bfb(%rip),%rax        # 401b <g_countermeasure>
    1420:	0f b6 00             	movzbl (%rax),%eax
    1423:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1426:	e8 95 fd ff ff       	call   11c0 <oracle>
    142b:	8b 75 f8             	mov    -0x8(%rbp),%esi
    142e:	0f b6 d0             	movzbl %al,%edx
    1431:	48 8d 05 e2 2b 00 00 	lea    0x2be2(%rip),%rax        # 401a <g_ptc>
    1438:	0f be 08             	movsbl (%rax),%ecx
    143b:	48 8d 3d c2 0b 00 00 	lea    0xbc2(%rip),%rdi        # 2004 <_IO_stdin_used+0x4>
    1442:	b0 00                	mov    $0x0,%al
    1444:	e8 e7 fb ff ff       	call   1030 <printf@plt>
    1449:	31 c0                	xor    %eax,%eax
    144b:	48 83 c4 10          	add    $0x10,%rsp
    144f:	5d                   	pop    %rbp
    1450:	c3                   	ret

Disassembly of section .fini:

0000000000001454 <_fini>:
    1454:	f3 0f 1e fa          	endbr64
    1458:	48 83 ec 08          	sub    $0x8,%rsp
    145c:	48 83 c4 08          	add    $0x8,%rsp
    1460:	c3                   	ret
