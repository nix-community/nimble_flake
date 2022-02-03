{
  description = ''Additional functions for sequences that are not present in sequtils'';
  inputs.src-sequtils2-1_1_0.flake = false;
  inputs.src-sequtils2-1_1_0.type = "github";
  inputs.src-sequtils2-1_1_0.owner = "Michedev";
  inputs.src-sequtils2-1_1_0.repo = "sequtils2";
  inputs.src-sequtils2-1_1_0.ref = "refs/tags/1.1.0";
  
  outputs = { self, nixpkgs, src-sequtils2-1_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sequtils2-1_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-sequtils2-1_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}