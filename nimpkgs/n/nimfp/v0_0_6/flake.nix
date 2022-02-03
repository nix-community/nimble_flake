{
  description = ''Nim functional programming library'';
  inputs.src-nimfp-v0_0_6.flake = false;
  inputs.src-nimfp-v0_0_6.type = "github";
  inputs.src-nimfp-v0_0_6.owner = "vegansk";
  inputs.src-nimfp-v0_0_6.repo = "nimfp";
  inputs.src-nimfp-v0_0_6.ref = "refs/tags/v0.0.6";
  
  outputs = { self, nixpkgs, src-nimfp-v0_0_6, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimfp-v0_0_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimfp-v0_0_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}