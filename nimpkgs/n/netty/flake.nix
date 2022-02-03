{
  description = ''Netty is a reliable UDP connection for games.'';
  inputs."netty-master".url = "path:./master";
  inputs."netty-0_2_0".url = "path:./0_2_0";
  inputs."netty-0_2_1".url = "path:./0_2_1";
  inputs."netty-v0_1_0".url = "path:./v0_1_0";
  outputs = { self, nixpkgs, ...}@inputs:
    let lib = import ./lib.nix;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}