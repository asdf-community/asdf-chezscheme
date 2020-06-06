# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test chezscheme https://github.com/vic/asdf-chezscheme.git "chezscheme --help"
```

Tests are automatically run in GitHub Actions on push and PR.
