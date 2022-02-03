{
  description = ''Python-like 'struct' for Nim'';
  inputs."struct-master".url = "path:./master";
  inputs."struct-v0_1_0".url = "path:./v0_1_0";
  inputs."struct-v0_1_1".url = "path:./v0_1_1";
  inputs."struct-v0_1_2".url = "path:./v0_1_2";
  inputs."struct-v0_2_0".url = "path:./v0_2_0";
  inputs."struct-v0_2_1".url = "path:./v0_2_1";
  inputs."struct-v0_2_2".url = "path:./v0_2_2";
  inputs."struct-v0_2_3".url = "path:./v0_2_3";
  outputs = { self, nixpkgs, ...}@inputs:
    let lib = import ./lib.nix;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}