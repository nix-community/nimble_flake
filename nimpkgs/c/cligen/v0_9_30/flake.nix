{
  description = ''Infer & generate command-line interace/option/argument parsers'';
  inputs.src-cligen-v0_9_30.flake = false;
  inputs.src-cligen-v0_9_30.type = "github";
  inputs.src-cligen-v0_9_30.owner = "c-blake";
  inputs.src-cligen-v0_9_30.repo = "cligen";
  inputs.src-cligen-v0_9_30.ref = "refs/tags/v0.9.30";
  
  outputs = { self, nixpkgs, src-cligen-v0_9_30, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cligen-v0_9_30;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cligen-v0_9_30"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}