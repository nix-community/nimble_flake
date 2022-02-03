{
  description = ''Library for finding the differences between two sequences'';
  inputs.src-diff-0_2_0.flake = false;
  inputs.src-diff-0_2_0.type = "github";
  inputs.src-diff-0_2_0.owner = "mark-summerfield";
  inputs.src-diff-0_2_0.repo = "diff";
  inputs.src-diff-0_2_0.ref = "refs/tags/0.2.0";
  
  outputs = { self, nixpkgs, src-diff-0_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-diff-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-diff-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}