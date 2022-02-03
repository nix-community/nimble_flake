{
  description = ''Nim utilities for advanced CPU operations: CPU identification, bindings to assorted intrinsics'';
  inputs.src-cpuwhat-master.flake = false;
  inputs.src-cpuwhat-master.type = "github";
  inputs.src-cpuwhat-master.owner = "awr1";
  inputs.src-cpuwhat-master.repo = "cpuwhat";
  inputs.src-cpuwhat-master.ref = "refs/heads/master";
  
  
  inputs."nimterop".url = "path:../../../n/nimterop";
  inputs."nimterop".type = "github";
  inputs."nimterop".owner = "riinr";
  inputs."nimterop".repo = "flake-nimble";
  inputs."nimterop".ref = "flake-pinning";
  inputs."nimterop".dir = "nimpkgs/n/nimterop";

  outputs = { self, nixpkgs, src-cpuwhat-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cpuwhat-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cpuwhat-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}