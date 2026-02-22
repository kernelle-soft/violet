# Violet

Language-agnostic code legibility analyzer.

> Work in progress — see project board for status.

## Build

```
go build -o violet ./cmd/violet
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
