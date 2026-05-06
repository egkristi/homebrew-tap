# homebrew-tap

Homebrew tap for Rust tools by [@egkristi](https://github.com/egkristi).

## Installation

```bash
brew tap egkristi/tap
```

Then install any formula:

```bash
brew install ravenfabric   # Secure remote execution & mesh networking
brew install ravenrag      # Local-first RAG engine
```

Or install directly without tapping:

```bash
brew install egkristi/tap/ravenfabric
```

## Updating

```bash
brew update
brew upgrade ravenfabric
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `ravenfabric` | Secure remote execution and mesh networking agent ([ravenfabric.io](https://ravenfabric.io)) |
| `ravenrag` | Local-first RAG engine (v1.0.0) |

## Automation

The `ravenfabric` formula is automatically updated on each [RavenFabric release](https://github.com/egkristi/RavenFabric/releases) via GitHub Actions.
