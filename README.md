# Dotfiles

OS X dotfiles.

[![asciicast](https://asciinema.org/a/47577.png)](https://asciinema.org/a/47577)

## How to install

The installation step requires the [XCode Command Line Tools](https://developer.apple.com/downloads)

```bash
java -v
xcode-select --install
```

Run the following commnad.

```bash
bash -c "$(curl -fsSL raw.github.com/u-4/dotfiles/master/dotfiles)"
# Overwrite dotfiles and deploy
bash -c "$(curl -fsSL raw.github.com/u-4/dotfiles/master/dotfiles)" -- -f -s deploy
```

## Initialize OS X

```bash
~/.dotfiles/dotfiles initialize
```

## Deploy dotfiles

```bash
~/.dotfiles/dotfiles deploy
```

## Set System Preferences using defaults function

```bash
~/.dotfiles/dotfiles defaults
```

## TODO

* change messages
