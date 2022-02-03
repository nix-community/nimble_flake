{
  description = ''A web DSL for Nim'';
  inputs.src-rosencrantz-0_1_7.flake = false;
  inputs.src-rosencrantz-0_1_7.type = "github";
  inputs.src-rosencrantz-0_1_7.owner = "andreaferretti";
  inputs.src-rosencrantz-0_1_7.repo = "rosencrantz";
  inputs.src-rosencrantz-0_1_7.ref = "refs/tags/0.1.7";
  
  outputs = { self, nixpkgs, src-rosencrantz-0_1_7, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rosencrantz-0_1_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-rosencrantz-0_1_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}