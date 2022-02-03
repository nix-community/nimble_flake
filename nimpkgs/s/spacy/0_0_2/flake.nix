{
  description = ''Spatial data structures for Nim.'';
  inputs.src-spacy-0_0_2.flake = false;
  inputs.src-spacy-0_0_2.type = "github";
  inputs.src-spacy-0_0_2.owner = "treeform";
  inputs.src-spacy-0_0_2.repo = "spacy";
  inputs.src-spacy-0_0_2.ref = "refs/tags/0.0.2";
  
  
  inputs."vmath".url = "path:../../../v/vmath";
  inputs."vmath".type = "github";
  inputs."vmath".owner = "riinr";
  inputs."vmath".repo = "flake-nimble";
  inputs."vmath".ref = "flake-pinning";
  inputs."vmath".dir = "nimpkgs/v/vmath";

  
  inputs."bumpy".url = "path:../../../b/bumpy";
  inputs."bumpy".type = "github";
  inputs."bumpy".owner = "riinr";
  inputs."bumpy".repo = "flake-nimble";
  inputs."bumpy".ref = "flake-pinning";
  inputs."bumpy".dir = "nimpkgs/b/bumpy";

  outputs = { self, nixpkgs, src-spacy-0_0_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-spacy-0_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-spacy-0_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}