{
  description = ''A compile-time, compact, fast, without allocation, state-machine generator.'';
  inputs."synthesis-master".url = "path:./master";
  inputs."synthesis-v0_1_0".url = "path:./v0_1_0";
  inputs."synthesis-v0_2_0".url = "path:./v0_2_0";
  outputs = { self, nixpkgs, ...}@inputs:
    let lib = import ./lib.nix;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}