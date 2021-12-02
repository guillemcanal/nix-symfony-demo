Symfony Demo Application
========================

The "Symfony Demo Application" is a reference application created to show how
to develop applications following the Symfony Best Practices.

Requirements
------------

Install [Nix](https://nixos.org/download.html) and [Direnv](https://direnv.net/docs/installation.html):

```bash
sh <(curl -L https://nixos.org/nix/install) --no-modify-profile
bash <(curl -sfL https://direnv.net/install.sh)
```

Enable [Nix Flakes](https://nixos.wiki/wiki/Flakes):

```bash
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

Add the following line at the end of your shell rc file (`~/.bashrc` or `~/.zshrc` ...):

```bash
# Load nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi
```

Add the Direnv hook to your shell:

<details><summary>ZSH</summary>

Add the following line at the end of the `~/.zshrc` file:

```zsh
eval "$(direnv hook zsh)"
```
</details>

<details><summary>BASH</summary>

Add the following line at the end of the `~/.bashrc` file:

```zsh
eval "$(direnv hook bash)"
```
</details>

> Other supported shells: https://direnv.net/docs/hook.html

Finally reload your shell:

```bash
exec $SHELL
```

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
