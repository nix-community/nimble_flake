{
  description = ''Infer & generate command-line interace/option/argument parsers'';
  inputs.src-cligen-v0_9_18.flake = false;
  inputs.src-cligen-v0_9_18.type = "github";
  inputs.src-cligen-v0_9_18.owner = "c-blake";
  inputs.src-cligen-v0_9_18.repo = "cligen";
  inputs.src-cligen-v0_9_18.ref = "refs/tags/v0.9.18";
  
  outputs = { self, nixpkgs, src-cligen-v0_9_18, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cligen-v0_9_18;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cligen-v0_9_18"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}