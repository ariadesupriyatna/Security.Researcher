
# Z3 Solver Cheatsheet

This cheatsheet provides an overview of Z3, a powerful SMT (Satisfiability Modulo Theories) solver. Z3 is used for solving logical, arithmetic, and optimization problems, among others. This guide focuses on the most common concepts and usage patterns.

## 1. **BitVec**

- **BitVec**: A vector of bits, used for bit-level operations. 
- **BitVecVal**: A BitVec with a specific initial value.
- A `BitVec` of `8 bits` = `1 byte`.

### **Common Operations on BitVec**
- **Bitwise AND, OR, XOR**: `x & y`, `x | y`, `x ^ y`.
- **Bitwise NOT**: `Not(x)`.

Example:
```python
x = BitVec('x', 8)
y = BitVec('y', 8)
z = x + y  # Arithmetic addition
```

## 2. **ZeroExt and SignExt**

- **ZeroExt**: Extends a BitVec with trailing zeroes (fills to higher bit-width with `0`s).
    ```python
    ZeroExt(24, foo)  # Extend foo from 8-bit to 24-bit.
    ```

- **SignExt**: Extends a BitVec with the sign bit (preserving the sign of the value).
    ```python
    SignExt(24, foo)  # Extend foo with sign bit.
    ```

## 3. **Solver**

- **Solver**: The core engine for solving logical and arithmetic problems. Constraints are added using `Solver.add(...)`.

### Basic Solver Example
```python
from z3 import *
x = BitVec('x', 8)
y = BitVec('y', 8)
solver = Solver()
solver.add(x + y == 10)  # Adding constraint
solver.add(x - y == 2)   # Adding another constraint

if solver.check() == sat:
    model = solver.model()
    print(f"x = {model[x]}, y = {model[y]}")
else:
    print("No solution")
```

## 4. **Arithmetic Logic**

- Z3 uses expressions instead of actual computation, which means that arithmetic operations on BitVecs will generate symbolic expressions.
    ```python
    foo = BitVecVal(0, 8)
    bar = [BitVec(f"bar_{i}", 8) for i in range(3)]
    for i in range(3):
        foo += bar[i]
    # Result is the expression: (foo + bar[0] + bar[1] + bar[2])
    ```

## 5. **Constraints and Satisfaction**

- **Constraints**: Logical conditions or equations that variables must satisfy.
- **Satisfiability (sat)**: If there is a solution that satisfies all constraints.
- **Unsatisfiability (unsat)**: If no solution exists.

```python
solver.add(x > 0)  # Add another constraint
```

## 6. **Relational Operators**

- You can use relational operators like `==`, `!=`, `>`, `<`, `>=`, `<=` for comparing BitVecs.
    ```python
    solver.add(x == y)  # x must equal y
    solver.add(x > y)   # x must be greater than y
    ```

## 7. **Optimization**

- Z3 can be used for optimization problems as well, such as maximizing or minimizing a function under certain constraints.

### Example of Optimization:
```python
opt = Optimize()
opt.add(x + y == 10)
opt.maximize(x)
if opt.check() == sat:
    model = opt.model()
    print(f"Maximized x: {model[x]}")
```

## 8. **Working with Arrays**

- Z3 supports **Arrays** as well. You can create and manipulate arrays of BitVecs.

```python
arr = Array('arr', BitVecSort(8), BitVecSort(8))
solver.add(arr[0] == BitVecVal(5, 8))  # Set first element to 5
```

## 9. **Example with Multiple Constraints**

Here is a more complex example that uses multiple constraints:

```python
from z3 import *

# Declare BitVecs
x = BitVec('x', 8)
y = BitVec('y', 8)
z = BitVec('z', 8)

# Create solver
solver = Solver()

# Add multiple constraints
solver.add(x + y == 10)
solver.add(y - z == 3)
solver.add(x * z == 5)

# Check for solution
if solver.check() == sat:
    model = solver.model()
    print(f"x = {model[x]}, y = {model[y]}, z = {model[z]}")
else:
    print("No solution found")
```

## Conclusion

Z3 is a powerful tool for solving problems that involve logical constraints, arithmetic, and optimization. This cheatsheet covers basic usage such as bit-vector operations, solver usage, constraints, and optimization. Explore Z3 documentation for more advanced features and capabilities.
