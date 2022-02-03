{
  description = ''libssh FFI bindings'';
  inputs."libssh-master".url = "path:./master";
  inputs."libssh-0_90_0".url = "path:./0_90_0";
  outputs = { self, nixpkgs, ...}@inputs:
    let lib = import ./lib.nix;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}