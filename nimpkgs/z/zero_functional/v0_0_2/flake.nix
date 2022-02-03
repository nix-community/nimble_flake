{
  description = ''A library providing zero-cost chaining for functional abstractions in Nim'';
  inputs.src-zero_functional-v0_0_2.flake = false;
  inputs.src-zero_functional-v0_0_2.type = "github";
  inputs.src-zero_functional-v0_0_2.owner = "zero-functional";
  inputs.src-zero_functional-v0_0_2.repo = "zero-functional";
  inputs.src-zero_functional-v0_0_2.ref = "refs/tags/v0.0.2";
  
  outputs = { self, nixpkgs, src-zero_functional-v0_0_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zero_functional-v0_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-zero_functional-v0_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}