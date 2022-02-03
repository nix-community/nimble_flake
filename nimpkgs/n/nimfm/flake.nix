{
  description = ''A library for factorization machines in Nim.'';
  inputs."nimfm-master".url = "path:./master";
  inputs."nimfm-v0_1_0".url = "path:./v0_1_0";
  inputs."nimfm-v0_2_0".url = "path:./v0_2_0";
  inputs."nimfm-v0_3_0".url = "path:./v0_3_0";
  outputs = { self, nixpkgs, ...}@inputs:
    let lib = import ./lib.nix;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}