{
  description = ''JSON serialization framework'';
  inputs.src-eminim-v1_1_0.flake = false;
  inputs.src-eminim-v1_1_0.type = "github";
  inputs.src-eminim-v1_1_0.owner = "planetis-m";
  inputs.src-eminim-v1_1_0.repo = "eminim";
  inputs.src-eminim-v1_1_0.ref = "refs/tags/v1.1.0";
  
  outputs = { self, nixpkgs, src-eminim-v1_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-eminim-v1_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-eminim-v1_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}