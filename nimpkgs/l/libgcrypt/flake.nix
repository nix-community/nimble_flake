{
  description = ''libgcrypt wrapper'';
  inputs."libgcrypt-master".url = "path:./master";
  inputs."libgcrypt-0_0_1".url = "path:./0_0_1";
  inputs."libgcrypt-0_1_1".url = "path:./0_1_1";
  outputs = { self, nixpkgs, ...}@inputs:
    let lib = import ./lib.nix;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}