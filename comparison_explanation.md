# Assembly to C Code Comparison

## Key Difference at Address 0x12f2

### Original Code (`verifypin_7.asm`)

**Assembly at line 229:**
```asm
12f0:	39 c8                	cmp    %ecx,%eax      ; Compare g_cardPin[i] with g_userPin[i]
12f2:	74 04                	je     12f8           ; Jump if EQUAL (skip setting diff)
12f4:	c6 45 f2 aa          	movb   $0xaa,-0xe(%rbp)  ; Set diff = BOOL_TRUE (0xaa)
```

**Equivalent C code:**
```c
if(g_userPin[i] != g_cardPin[i]) {
    diff = BOOL_TRUE;  // Correct: flag difference when pins don't match
}
```

### Faulted Code (`faulted.asm`)

**Assembly at line 229:**
```asm
12f0:	39 c8                	cmp    %ecx,%eax      ; Compare g_cardPin[i] with g_userPin[i]
12f2:	75 04                	jne    12f8           ; Jump if NOT EQUAL (skip setting diff)
12f4:	c6 45 f2 aa          	movb   $0xaa,-0xe(%rbp)  ; Set diff = BOOL_TRUE (0xaa)
```

**Equivalent C code:**
```c
if(g_userPin[i] == g_cardPin[i]) {  // ❌ INVERTED!
    diff = BOOL_TRUE;  // WRONG: flag difference when pins MATCH!
}
```

## Complete verifyPIN Function Comparison

### Original C Code Structure

```c
BOOL verifyPIN() {
    int stepCounter = 0;
    int i;
    BOOL status;
    BOOL diff;
    g_authenticated = BOOL_FALSE;

    if(g_ptc > 0) {
        stepCounter++;
        if(stepCounter != 1) {
            countermeasure();
        }
        g_ptc--;
        stepCounter++;
        if(stepCounter != 2) {
            countermeasure();
        }

        status = BOOL_FALSE;
        diff = BOOL_FALSE;

        stepCounter++;
        if(stepCounter != 3) {
            countermeasure();
        }
        
        // PIN COMPARISON LOOP
        for(i = 0; i < PIN_SIZE; i++) {
            if(g_userPin[i] != g_cardPin[i]) {  // ✅ CORRECT
                diff = BOOL_TRUE;
            }
            stepCounter++;
            if(stepCounter != i+4) {
                countermeasure();
            }
        }
        
        // ... rest of function ...
        if (diff == BOOL_FALSE) {
            status = BOOL_TRUE;
        } else {
            status = BOOL_FALSE;
        }
        
        if(status == BOOL_TRUE) {
            g_ptc = 3;
            g_authenticated = BOOL_TRUE;
            return BOOL_TRUE;
        }
    }

    return BOOL_FALSE;
}
```

### Faulted C Code Structure

```c
BOOL verifyPIN() {
    int stepCounter = 0;
    int i;
    BOOL status;
    BOOL diff;
    g_authenticated = BOOL_FALSE;

    if(g_ptc > 0) {
        // ... same initialization code ...
        
        // PIN COMPARISON LOOP - FAULTED VERSION
        for(i = 0; i < PIN_SIZE; i++) {
            if(g_userPin[i] == g_cardPin[i]) {  // ❌ INVERTED CONDITION!
                diff = BOOL_TRUE;  // Sets diff when pins MATCH (WRONG!)
            }
            // ... same stepCounter checks ...
        }
        
        // ... rest of function (same) ...
    }

    return BOOL_FALSE;
}
```

## Security Impact

**Original behavior:**
- `diff = TRUE` only when pins differ → authentication fails correctly
- `diff = FALSE` when all pins match → authentication succeeds correctly

**Faulted behavior:**
- `diff = TRUE` when pins match → authentication fails incorrectly
- `diff = FALSE` when pins differ → authentication might succeed incorrectly

This is a **critical security flaw** that inverts the PIN verification logic!
