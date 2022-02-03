{
  description = ''Localization package for Nim.'';
  inputs.src-loco-0_1_1.flake = false;
  inputs.src-loco-0_1_1.type = "github";
  inputs.src-loco-0_1_1.owner = "moigagoo";
  inputs.src-loco-0_1_1.repo = "loco";
  inputs.src-loco-0_1_1.ref = "refs/tags/0.1.1";
  
  outputs = { self, nixpkgs, src-loco-0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-loco-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-loco-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}