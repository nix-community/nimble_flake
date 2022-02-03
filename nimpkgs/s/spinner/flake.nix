{
  description = ''Prebuilt components for the Fidget GUI library.'';
  inputs."spinner-master".url = "path:./master";
  inputs."spinner-v0_1_0".url = "path:./v0_1_0";
  inputs."spinner-v0_1_1".url = "path:./v0_1_1";
  inputs."spinner-v0_1_2".url = "path:./v0_1_2";
  inputs."spinner-v0_1_3".url = "path:./v0_1_3";
  inputs."spinner-v0_2_0".url = "path:./v0_2_0";
  inputs."spinner-v0_2_1".url = "path:./v0_2_1";
  outputs = { self, nixpkgs, ...}@inputs:
    let lib = import ./lib.nix;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}