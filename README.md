# Nix Configuration

This is my personal NixOS configuration (for whenever I end up using the distro, it's not all the time.)

Most utilities should be preconfigured for how I enjoy using the distro.

## Usage
First off, you'll need a NixOS installation with access to the internet, and `git` installed.

Then you can clone this repo by running: `git clone https://github.com/CoryBorek/nixconfig`

From there, you can `cd` into the folder that contains this repo, and run `./setup.sh`

That will set up a generic installation with just a few command-line utilities.

### Versions
If you pass in an argument to `./setup.sh`, you can choose a few pre-defined setups. There are currently three supported ones.

1. nixos-desktop - A Desktop environment with Cinnamon installed
2. nixos-kde-desktop - A Desktop environment with KDE Plasma 6 installed.
3. nixos-term - A terminal-only environment with only a few basic utilities installed.


## Common User Programs
I generally try to keep two programs installed in general:

1. git - so I can update this repo, and others as I need
2. gh - A tool to easily log into github to make any pushes or changes.
3. emacs - It's the editor that my school suggests, so I have it installed for when I need it.
4. wget - Allows me to download files from the internet.


## Environments
All programming environments that are able to be grabbed via a config, should be.

They should be within a `shell.nix` file.

Here's an example:

```nix
with import <nixpkgs> {};

mkShell {
        buildInputs = [ gcc valgrind gdb gnumake ];
}
```