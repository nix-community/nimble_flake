{
  description = ''Root finding functions for Nim'';
  inputs.src-roots-v0_3_1.flake = false;
  inputs.src-roots-v0_3_1.type = "github";
  inputs.src-roots-v0_3_1.owner = "BarrOff";
  inputs.src-roots-v0_3_1.repo = "roots";
  inputs.src-roots-v0_3_1.ref = "refs/tags/v0.3.1";
  
  outputs = { self, nixpkgs, src-roots-v0_3_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-roots-v0_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-roots-v0_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}