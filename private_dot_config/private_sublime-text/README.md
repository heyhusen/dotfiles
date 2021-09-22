# ~/.config/sublime-text

This configuration is for Sublime Text 4.

## Requirements
- [flake8](https://flake8.pycqa.org/)
- [golangci-lint](https://github.com/golangci/golangci-lint)
- [gopls](https://github.com/golang/tools/tree/master/gopls)
- [hadolint](https://github.com/hadolint/hadolint)
- [markdownlint](https://github.com/igorshubovych/markdownlint-cli)
- [php-cs-fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)
- [rust-analyzer](https://rust-analyzer.github.io/)
- [shellcheck](https://github.com/koalaman/shellcheck)

Some requirement above can be installed in Arch Linux using [paru](https://github.com/morganamilo/paru)
```bash
paru -S golangci-lint-bin hadolint-bin rust-analyzer gopls shellcheck flake8
```

```bash
npm install -g markdownlint-cli
```

> Install php-cs-fixer locally in project directory.
```bash
composer require --dev friendsofphp/php-cs-fixer
```

