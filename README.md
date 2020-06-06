<div align="center">

# asdf-chezscheme ![Build](https://github.com/asdf-community/asdf-chezscheme/workflows/Build/badge.svg) ![Lint](https://github.com/asdf-community/asdf-chezscheme/workflows/Lint/badge.svg)

[chezscheme](https://github.com/asdf-community/chezscheme) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, `make`: generic POSIX build utilities.
- Set env `ASDF_CHEZ_CONFIGURE_OPTS` if you need custom options for `./configure`

# Install

Plugin:

```shell
asdf plugin add chezscheme
# or
asdf plugin add https://github.com/asdf-community/asdf-chezscheme.git
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
scheme --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/asdf-community/asdf-chezscheme/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Victor Hugo Borja](https://github.com/asdf-community/)
