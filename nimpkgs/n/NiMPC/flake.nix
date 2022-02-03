{
  description = ''Secure multi-party computation'';
  inputs."NiMPC-master".url = "path:./master";
  inputs."NiMPC-v0_1_0".url = "path:./v0_1_0";
  inputs."NiMPC-v0_2_0".url = "path:./v0_2_0";
  inputs."NiMPC-v0_3_0".url = "path:./v0_3_0";
  inputs."NiMPC-v0_4_0".url = "path:./v0_4_0";
  inputs."NiMPC-v0_4_1".url = "path:./v0_4_1";
  outputs = { self, nixpkgs, ...}@inputs:
    let lib = import ./lib.nix;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}