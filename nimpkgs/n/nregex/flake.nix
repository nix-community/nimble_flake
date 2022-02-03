{
  description = ''A DFA based regex engine'';
  inputs."nregex-master".url = "path:./master";
  inputs."nregex-v0_0_1".url = "path:./v0_0_1";
  inputs."nregex-v0_0_2".url = "path:./v0_0_2";
  inputs."nregex-v0_0_3".url = "path:./v0_0_3";
  inputs."nregex-v0_0_4".url = "path:./v0_0_4";
  outputs = { self, nixpkgs, ...}@inputs:
    let lib = import ./lib.nix;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}