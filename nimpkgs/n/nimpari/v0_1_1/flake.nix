{
  description = ''Nim wrapper for the PARI library'';
  inputs.src-nimpari-v0_1_1.flake = false;
  inputs.src-nimpari-v0_1_1.type = "github";
  inputs.src-nimpari-v0_1_1.owner = "BarrOff";
  inputs.src-nimpari-v0_1_1.repo = "nim-pari";
  inputs.src-nimpari-v0_1_1.ref = "refs/tags/v0.1.1";
  
  
  inputs."nimterop".url = "path:../../../n/nimterop";
  inputs."nimterop".type = "github";
  inputs."nimterop".owner = "riinr";
  inputs."nimterop".repo = "flake-nimble";
  inputs."nimterop".ref = "flake-pinning";
  inputs."nimterop".dir = "nimpkgs/n/nimterop";

  outputs = { self, nixpkgs, src-nimpari-v0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimpari-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimpari-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}