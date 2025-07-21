# dotfiles

This is my personal collection of dotfiles and configuration files for various applications and tools.

By dotter command, you can install these dotfiles on your system. The dotter command is a tool for managing dotfiles and configurations.
See more about dotter [https://github.com/SuperCuber/dotter](https://github.com/SuperCuber/dotter)

## Requirements

### Dotter

#### Mac OS

`brew install dotter`

#### Windows OS

`scoop install dotter`

#### Linux or Other OS

`cargo install dotter`

### Environment Variables

#### Common

- STARSHIP_CONFIG: `~/.config/starship/starship.toml`

#### Windows OS

- HOME : `~`
- XDG_CACHE_HOME : `~/.cache`
- XDG_CONFIG_HOME : `~/.config`
- XDG_DATA_HOME : `~/.local/share`
- XDG_STATE_HOME : `~/.local/state`

## Install

clone this repository into any directory you like, for example, `~/.config/.dotfiles`.

And write create `local.toml` file in the same directory with the following content like:

```toml
includes = [".dotter/linux.toml"]
packages = ["linux"]
```

And run command: `dotter deploy`

