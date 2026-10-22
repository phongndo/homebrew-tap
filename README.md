# phongndo Homebrew tap

Homebrew formulae for [phongndo](https://github.com/phongndo) projects.

## Install

Install a formula directly from this tap:

```sh
brew install phongndo/tap/mark-cli
brew install phongndo/tap/frame
brew install phongndo/tap/leetvim
brew install phongndo/tap/hz-cli
brew install phongndo/tap/lemma
brew install --cask phongndo/tap/lemma
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
| [`leetvim`](Formula/leetvim.rb) | [leetvim](https://github.com/phongndo/leetvim) | `leetvim` |
| [`hz-cli`](Formula/hz-cli.rb) | [hz](https://github.com/phongndo/hz) | `hz` |
| [`lemma`](Formula/lemma.rb) | [Lemma](https://github.com/phongndo/lemma) | `lemma` |

## Casks

| Cask | Project | Installs |
| --- | --- | --- |
| [`lemma`](Casks/lemma.rb) | [Lemma](https://github.com/phongndo/lemma) | Lemma.app, and its `lemma` |

Formula and cask updates are generated from each project's verified release checksums.
Each updater picks up its project's stable releases every hour, or at once when the
project's release workflow dispatches it, and can also be run manually.
