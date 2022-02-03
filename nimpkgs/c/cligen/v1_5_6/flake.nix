{
  description = ''Infer & generate command-line interace/option/argument parsers'';
  inputs.src-cligen-v1_5_6.flake = false;
  inputs.src-cligen-v1_5_6.type = "github";
  inputs.src-cligen-v1_5_6.owner = "c-blake";
  inputs.src-cligen-v1_5_6.repo = "cligen";
  inputs.src-cligen-v1_5_6.ref = "refs/tags/v1.5.6";
  
  outputs = { self, nixpkgs, src-cligen-v1_5_6, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cligen-v1_5_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cligen-v1_5_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}