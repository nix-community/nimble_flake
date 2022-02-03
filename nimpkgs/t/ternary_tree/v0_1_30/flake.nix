{
  description = ''Structural sharing data structure of lists and maps.'';
  inputs.src-ternary_tree-v0_1_30.flake = false;
  inputs.src-ternary_tree-v0_1_30.type = "github";
  inputs.src-ternary_tree-v0_1_30.owner = "calcit-lang";
  inputs.src-ternary_tree-v0_1_30.repo = "ternary-tree";
  inputs.src-ternary_tree-v0_1_30.ref = "refs/tags/v0.1.30";
  
  outputs = { self, nixpkgs, src-ternary_tree-v0_1_30, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ternary_tree-v0_1_30;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-ternary_tree-v0_1_30"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}