{
  description = ''C macro for Nim.'';
  inputs.src-nimish-v0_1_0.flake = false;
  inputs.src-nimish-v0_1_0.type = "github";
  inputs.src-nimish-v0_1_0.owner = "xflywind";
  inputs.src-nimish-v0_1_0.repo = "nimish";
  inputs.src-nimish-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, src-nimish-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimish-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimish-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}