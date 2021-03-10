# Nimble packages Nix flake

This repository contains experimental-grade, auto-generated
[Nim](https://nim-lang.org/) packages.

## TODO:
 - automatic testing
 - back-versioning
 - regular updates

## Usage

```shell
nix run nimble#fugitive
  # Build and execute a Nimble binary

nix dev-shell nimble
  # Enter a shell with the Nim and Nimble utilities
```

For an example of how to refer to Nim packages when building a Nix package you could have a look at [this flake](https://git.sr.ht/~ehmry/upload_bot/tree/master/item/flake.nix)

## Synchronization

```sh
nix run .#package-updater

# …or to update an invidual package…

nix run .#package-updater generate foobar
```

This will prefetch the repositories of new and updated Nimble packages and
record the necessary metadata to fetch the source as a fixed-output derivation.
Each package has such a fixed-output that is used as a input to a derivations
that produce metadata to (attempt to) build the package.

## Upstream

Dependencies from Nixpkgs can be declared upstream from the *.nimble file. This
feature is experimental and still needs to be negotiated with the Nimble team.

```nim
# toxcore.nimble
...

import distros
if detectOs(NixOS): # true for NixOS or any Nix shell
  foreignDep "libtoxcore"
  foreignDep "pkgconfig"
```
