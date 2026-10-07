#!/usr/bin/env bash
# Same toolchain the project was developed and tested with:
# Ubuntu 24.04, system OCaml 4.14.1, Hardcaml v0.16, yosys for area checks.
set -euo pipefail

sudo apt-get update
sudo apt-get install -y --no-install-recommends \
  ocaml opam build-essential m4 unzip rsync git git-lfs pkg-config libgmp-dev yosys

export OPAMYES=1
opam init --bare --disable-sandboxing -n
opam switch create fipe ocaml-system
eval "$(opam env --switch=fipe)"

opam install dune hardcaml.v0.16.0 hardcaml_waveterm.v0.16.0 \
  ppx_deriving_hardcaml.v0.16.0 ppx_jane.v0.16.0 ppx_expect.v0.16.0

# Editor support; optional, so a failure here does not block the build.
opam install ocaml-lsp-server ocamlformat || echo "editor tools skipped"

grep -q 'opam env --switch=fipe' ~/.bashrc || \
  echo 'eval "$(opam env --switch=fipe)"' >> ~/.bashrc

dune build
dune runtest && echo "fipe: all tests pass"
