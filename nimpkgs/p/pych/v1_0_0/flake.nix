{
  description = ''A tool that watches Python files and re-runs them on change.'';
  inputs.src-pych-v1_0_0.flake = false;
  inputs.src-pych-v1_0_0.type = "github";
  inputs.src-pych-v1_0_0.owner = "rburmorrison";
  inputs.src-pych-v1_0_0.repo = "pych";
  inputs.src-pych-v1_0_0.ref = "refs/tags/v1.0.0";
  
  outputs = { self, nixpkgs, src-pych-v1_0_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pych-v1_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-pych-v1_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}