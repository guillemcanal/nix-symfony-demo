Symfony Demo Application
========================

The "Symfony Demo Application" is a reference application created to show how
to develop applications following the Symfony Best Practices.

Requirements
------------

Install [Nix](https://nixos.org/download.html)
and enable [flakes](https://nixos.wiki/wiki/Flakes) with:

```bash
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

> **Nix** is a system package manager and a functional language which provide reproductible builds and development environments.

Install [Direnv](https://direnv.net/docs/installation.html)
and add its [hook into your shell](https://direnv.net/docs/hook.html).

Reload your shell:

```bash
exec $SHELL
```

Enable `direnv` for this project:

```bash
direnv allow
```

> **Direnv** automatically load and unload environment variables in a subshell depending on your current directory. 

Run the project
---------------

```bash
make up
```
The application will open in your browser.

> This project provide additional commands, you can list them by doing `make help`

Tests
-----

Execute this command to run tests:

```bash
$ ./bin/phpunit
```
