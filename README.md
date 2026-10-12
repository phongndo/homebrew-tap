# phongndo Homebrew tap

Homebrew formulae for [phongndo](https://github.com/phongndo) projects.

## Install

Install a formula directly from this tap:

```sh
brew install phongndo/tap/mark-cli
brew install phongndo/tap/frame
brew install phongndo/tap/leetvim
brew install phongndo/tap/hz-cli
```

Alternatively, add the tap once and then install formulae by name:

```sh
brew tap phongndo/tap
brew install mark-cli
```

## Formulae

| Formula | Project | Executable |
| --- | --- | --- |
| [`mark-cli`](Formula/mark-cli.rb) | [Mark](https://github.com/phongndo/mark) | `mark` |
| [`frame`](Formula/frame.rb) | [Frame](https://github.com/phongndo/frame) | `frame` |
| `leetvim` | [leetvim](https://github.com/phongndo/leetvim) | `leetvim` |
| `hz-cli` | [hz](https://github.com/phongndo/hz) | `hz` |

Formula updates are generated from each project's verified release checksums.
Each updater picks up its project's stable releases every six hours, or at once when the
project's release workflow dispatches it, and can also be run manually. `leetvim` and `hz-cli`
appear with their projects' first releases.
