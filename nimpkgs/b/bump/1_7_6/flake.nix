{
  description = ''a tiny tool to bump nimble versions'';
  inputs.src-bump-1_7_6.flake = false;
  inputs.src-bump-1_7_6.type = "github";
  inputs.src-bump-1_7_6.owner = "disruptek";
  inputs.src-bump-1_7_6.repo = "bump";
  inputs.src-bump-1_7_6.ref = "refs/tags/1.7.6";
  
  
  inputs."cligen".url = "path:../../../c/cligen";
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";

  outputs = { self, nixpkgs, src-bump-1_7_6, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bump-1_7_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-bump-1_7_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}