{
  description = ''Additions to the Nim's standard library, like boost for C++'';
  inputs.src-nimboost-v0_3_3.flake = false;
  inputs.src-nimboost-v0_3_3.type = "github";
  inputs.src-nimboost-v0_3_3.owner = "vegansk";
  inputs.src-nimboost-v0_3_3.repo = "nimboost";
  inputs.src-nimboost-v0_3_3.ref = "refs/tags/v0.3.3";
  
  outputs = { self, nixpkgs, src-nimboost-v0_3_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimboost-v0_3_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimboost-v0_3_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}