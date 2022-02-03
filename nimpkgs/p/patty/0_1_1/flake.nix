{
  description = ''Algebraic data types and pattern matching'';
  inputs.src-patty-0_1_1.flake = false;
  inputs.src-patty-0_1_1.type = "github";
  inputs.src-patty-0_1_1.owner = "andreaferretti";
  inputs.src-patty-0_1_1.repo = "patty";
  inputs.src-patty-0_1_1.ref = "refs/tags/0.1.1";
  
  outputs = { self, nixpkgs, src-patty-0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-patty-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-patty-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}