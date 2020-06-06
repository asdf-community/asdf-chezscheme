<div align="center">

# asdf-chezscheme ![Build](https://github.com/vic/asdf-chezscheme/workflows/Build/badge.svg) ![Lint](https://github.com/vic/asdf-chezscheme/workflows/Lint/badge.svg)

[chezscheme](https://github.com/vic/chezscheme) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add chezscheme
# or
asdf plugin add https://github.com/vic/asdf-chezscheme.git
```

chezscheme:

```shell
# Show all installable versions
asdf list-all chezscheme

# Install specific version
asdf install chezscheme latest

# Set a version globally (on your ~/.tool-versions file)
asdf global chezscheme latest

# Now chezscheme commands are available
chezscheme --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/vic/asdf-chezscheme/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Victor Hugo Borja](https://github.com/vic/)
