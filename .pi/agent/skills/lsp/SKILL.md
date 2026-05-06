---
name: lsp
description: >
  Query definitions, references, and diagnostics.
  Use when navigating code, finding symbol usages,
  or checking errors in project.
---

# LSP

## Usage

### Find References

```bash
{baseDir}/lsp ref <file:line> <symbol>
```

Example:
```bash
{baseDir}/lsp ref src/main.rs:42 my_function
```

### Go to Definition

```bash
{baseDir}/lsp def <file:line> <symbol>
```

Example:
```bash
{baseDir}/lsp def src/main.rs:42 MyStruct
```

### Show Diagnostics

```bash
{baseDir}/lsp diag <file>
```

Example:
```bash
{baseDir}/lsp diag src/main.rs
```
