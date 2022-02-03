{
  description = ''Statistic-driven microbenchmark framework'';
  inputs.src-criterion-0_1_2.flake = false;
  inputs.src-criterion-0_1_2.type = "github";
  inputs.src-criterion-0_1_2.owner = "disruptek";
  inputs.src-criterion-0_1_2.repo = "criterion";
  inputs.src-criterion-0_1_2.ref = "refs/tags/0.1.2";
  
  outputs = { self, nixpkgs, src-criterion-0_1_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-criterion-0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-criterion-0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}