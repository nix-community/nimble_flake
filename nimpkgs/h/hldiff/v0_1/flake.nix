{
  description = ''A highlighter for diff -u-like output & port of Python difflib'';
  inputs.src-hldiff-v0_1.flake = false;
  inputs.src-hldiff-v0_1.type = "github";
  inputs.src-hldiff-v0_1.owner = "c-blake";
  inputs.src-hldiff-v0_1.repo = "hldiff";
  inputs.src-hldiff-v0_1.ref = "refs/tags/v0.1";
  
  
  inputs."cligen".url = "path:../../../c/cligen";
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";

  outputs = { self, nixpkgs, src-hldiff-v0_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hldiff-v0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-hldiff-v0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}