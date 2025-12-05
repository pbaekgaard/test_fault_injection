# Understanding Stack Offsets in Assembly

## The Minus Sign is NOT an Increment/Decrement!

The minus sign in `-0x8(%rbp)` indicates a **memory address offset**, not an arithmetic operation.

## How Stack Addressing Works

### Stack Memory Layout

In x86-64, the stack grows downward (towards lower addresses). When a function allocates stack space, it looks like this:

```
Higher Memory Addresses
         ↓
    ┌─────────────┐ ← %rbp (Base Pointer - points HERE)
    │  Saved %rbp │  0(%rbp)  or  (%rbp)
    ├─────────────┤
    │             │ -0x1(%rbp)
    ├─────────────┤
    │   status    │ -0xd(%rbp)  (1 byte)
    ├─────────────┤
    │    diff     │ -0xe(%rbp)  (1 byte)
    ├─────────────┤
    │             │ -0xf(%rbp)
    ├─────────────┤
    │      i      │ -0xc(%rbp)  (4 bytes, ends at -0x9)
    ├─────────────┤
    │ stepCounter │ -0x8(%rbp)  (4 bytes, ends at -0x5)
    ├─────────────┤
    │             │
    │             │ ← %rsp (Stack Pointer)
    │             │
         ↑
Lower Memory Addresses
```

### What `-0x8(%rbp)` Means

```
-0x8(%rbp)
  │  │   │
  │  │   └─ Base Pointer register
  │  └───── Offset value (hexadecimal 8 = decimal 8)
  └──────── Direction: NEGATIVE offset = 8 bytes BELOW %rbp
```

**Translation:** "The memory address that is 8 bytes below (towards lower addresses) from where %rbp points"

This is just telling the CPU **WHERE** to read/write memory, not what operation to perform!

## The Increment Sequence

Here's the complete 3-instruction sequence that performs the increment:

```asm
12f8:  8b 45 f8        mov    -0x8(%rbp),%eax   ; STEP 1: LOAD value FROM memory
12fb:  83 c0 01        add    $0x1,%eax         ; STEP 2: INCREMENT the value
12fe:  89 45 f8        mov    %eax,-0x8(%rbp)   ; STEP 3: STORE value TO memory
```

### Step-by-Step Breakdown

**Step 1: `mov -0x8(%rbp),%eax`**
- Reads 4 bytes FROM the stack location `-0x8(%rbp)` 
- Stores it INTO register `%eax`
- **This is just loading the variable, no math!**

**Step 2: `add $0x1,%eax`**
- This is where the **actual increment** happens!
- Adds 1 to the value in `%eax`
- `$0x1` means immediate value 1

**Step 3: `mov %eax,-0x8(%rbp)`**
- Writes 4 bytes FROM register `%eax`
- Stores it TO the stack location `-0x8(%rbp)`
- **This is just storing the variable, no math!**

## C Code Equivalent

```c
stepCounter++;  // Single line in C
```

**Becomes 3 instructions in assembly:**
```c
eax = stepCounter;      // mov -0x8(%rbp),%eax   (LOAD)
eax = eax + 1;          // add $0x1,%eax         (INCREMENT)
stepCounter = eax;      // mov %eax,-0x8(%rbp)   (STORE)
```

## Why Use Registers?

The CPU can't directly increment a value in memory. It must:
1. **Load** the value from memory into a register
2. **Perform** the arithmetic operation in the register
3. **Store** the result back to memory

## Visual Example

Let's say `stepCounter` currently has value 3:

```
Memory (stack):              Register:
┌──────────────┐            ┌─────────┐
│ stepCounter  │            │   %eax  │
│      = 3     │            │         │
│ at -0x8(%rbp)│            └─────────┘
└──────────────┘

Step 1: mov -0x8(%rbp),%eax
┌──────────────┐            ┌─────────┐
│ stepCounter  │   ────→    │   %eax  │
│      = 3     │    COPY    │   = 3   │
│ at -0x8(%rbp)│            └─────────┘
└──────────────┘

Step 2: add $0x1,%eax
┌──────────────┐            ┌─────────┐
│ stepCounter  │            │   %eax  │
│      = 3     │            │   = 4   │  ← INCREMENTED!
│ at -0x8(%rbp)│            └─────────┘
└──────────────┘

Step 3: mov %eax,-0x8(%rbp)
┌──────────────┐            ┌─────────┐
│ stepCounter  │   ←────────│   %eax  │
│      = 4     │    COPY    │   = 4   │
│ at -0x8(%rbp)│            └─────────┘
└──────────────┘
```

## Key Takeaways

1. **`-0x8(%rbp)`** = memory address (8 bytes below base pointer)
2. **`add $0x1,%eax`** = the actual increment operation
3. The minus sign in addressing is about **location**, not **operation**
4. Increment requires: LOAD → ADD → STORE (3 separate instructions)
