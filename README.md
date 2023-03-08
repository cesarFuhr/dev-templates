# dev-templates

A collection of useful development environment templates.

To enter the development shell after `nix flake init`:
```bash
nix develop --command $SHELL
```

To avoid copying the folder multiple times store the env in a profile.
If you want this shell environments to be persistent, don't use the `tmp` directory, use something like `~/.local/share/nix/dev-envs/`. Make sure the directory exists before writing to it. Don't forget to erase unused profiles every now and then.
```bash
nix develop --profile /tmp/${${PWD//\//:}:1} --command $SHELL
```

After storing a first time, you can run the stored profile with:
```bash
nix develop /tmp/${${PWD//\//:}:1} --command $SHELL
```

| **Template** |                       **Command**                     |
|--------------|:-----------------------------------------------------:|
| go           | nix flake init -t github:cesarfuhr/dev-templates#go   |
| rust         | nix flake init -t github:cesarfuhr/dev-templates#rust |
