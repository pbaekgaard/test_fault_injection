# Assembly Instruction Explanation

## Stack Layout in verifyPIN Function

The function allocates 16 bytes of stack space (`sub $0x10,%rsp`) and uses the following layout:

```
Higher addresses (closer to %rbp)
┌─────────────────┐
│ -0x8(%rbp)      │  stepCounter (int, 4 bytes)
├─────────────────┤
│ -0xc(%rbp)      │  i (int, 4 bytes)  
├─────────────────┤
│ -0xd(%rbp)      │  status (BOOL, 1 byte)
├─────────────────┤
│ -0xe(%rbp)      │  diff (BOOL, 1 byte)
└─────────────────┘
Lower addresses
```

## Instruction Breakdown

### `12f4: c6 45 f2 aa  movb $0xaa,-0xe(%rbp)`

**What it does:**
- `movb` = move byte (8-bit operation)
- `$0xaa` = immediate value 0xaa (hexadecimal) = 170 (decimal)
- `-0xe(%rbp)` = memory address at %rbp offset by -0xe (14 bytes below base pointer)

**C equivalent:**
```c
diff = BOOL_TRUE;  // 0xaa = 170 = BOOL_TRUE
```

**Context:**
This instruction is executed when `g_userPin[i] != g_cardPin[i]` (pins don't match).
It sets the `diff` flag to indicate a difference was found.

### `12f8: 8b 45 f8  mov -0x8(%rbp),%eax`

**What it does:**
- `mov` = move (32-bit operation, default for int)
- `-0x8(%rbp)` = memory address at %rbp offset by -0x8 (8 bytes below base pointer)
- `%eax` = 32-bit register (lower 32 bits of %rax)

**C equivalent:**
```c
eax = stepCounter;  // Load stepCounter into register
```

**Context:**
This loads the `stepCounter` variable into register %eax, likely to increment it:
```c
stepCounter++;  // Next instruction adds 1
```

## Complete Code Context

Here's what's happening around these instructions:

```c
for(i = 0; i < PIN_SIZE; i++) {
    if(g_userPin[i] != g_cardPin[i]) {
        diff = BOOL_TRUE;           // ← Line 12f4: movb $0xaa,-0xe(%rbp)
    }
    stepCounter++;                  // ← Line 12f8: mov -0x8(%rbp),%eax
                                    //    Then add 1, store back
    if(stepCounter != i+4) {
        countermeasure();
    }
}
```

## BOOL Value Encoding

Looking at the code:
- `0x55` (85 decimal) = `BOOL_FALSE`
- `0xaa` (170 decimal) = `BOOL_TRUE`

Notice: `0x55` + `0xaa` = `0xff` (255), and `0x55 XOR 0xaa = 0xff`
These are bitwise complements, making them easy to detect corruption.

## Assembly Sequence

```asm
12f0:  39 c8              cmp    %ecx,%eax        ; Compare g_cardPin[i] vs g_userPin[i]
12f2:  74 04              je     12f8             ; If equal, jump past setting diff
12f4:  c6 45 f2 aa        movb   $0xaa,-0xe(%rbp) ; diff = BOOL_TRUE (if pins differ)
12f8:  8b 45 f8           mov    -0x8(%rbp),%eax  ; Load stepCounter into eax
12fb:  83 c0 01           add    $0x1,%eax        ; stepCounter++
12fe:  89 45 f8           mov    %eax,-0x8(%rbp)  ; Store stepCounter back
```

This corresponds to:
```c
if(g_userPin[i] != g_cardPin[i]) {
    diff = BOOL_TRUE;  // Only set if pins don't match
}
stepCounter++;
```
