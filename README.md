# Violet

Language-agnostic code legibility analyzer. Scores source files on comparative depth, verbosity, and syntactic density using information-theoretic penalty functions.


## Quick start

```
go build -o violet ./cmd/violet
./violet path/to/source
```

## Project layout

```
cmd/violet/       CLI entry point (cobra)
internal/
  scoring/        Core legibility metrics
  chunking/       Blank-line / indentation block splitter
  directives/     Inline ignore annotations
  config/         violet.yaml loading and merging
  analysis/       File-level orchestration
  output/         Terminal and JSON formatters
```
