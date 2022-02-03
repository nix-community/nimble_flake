{
  description = ''Nim functional programming library'';
  inputs.src-nimfp-v0_2_0.flake = false;
  inputs.src-nimfp-v0_2_0.type = "github";
  inputs.src-nimfp-v0_2_0.owner = "vegansk";
  inputs.src-nimfp-v0_2_0.repo = "nimfp";
  inputs.src-nimfp-v0_2_0.ref = "refs/tags/v0.2.0";
  
  outputs = { self, nixpkgs, src-nimfp-v0_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimfp-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimfp-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}