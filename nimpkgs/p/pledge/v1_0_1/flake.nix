{
  description = ''OpenBSDs pledge(2) for Nim.'';
  inputs.src-pledge-v1_0_1.flake = false;
  inputs.src-pledge-v1_0_1.type = "github";
  inputs.src-pledge-v1_0_1.owner = "euantorano";
  inputs.src-pledge-v1_0_1.repo = "pledge.nim";
  inputs.src-pledge-v1_0_1.ref = "refs/tags/v1.0.1";
  
  outputs = { self, nixpkgs, src-pledge-v1_0_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pledge-v1_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-pledge-v1_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}