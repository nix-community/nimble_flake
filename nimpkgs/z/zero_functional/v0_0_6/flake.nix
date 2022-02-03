{
  description = ''A library providing zero-cost chaining for functional abstractions in Nim'';
  inputs.src-zero_functional-v0_0_6.flake = false;
  inputs.src-zero_functional-v0_0_6.type = "github";
  inputs.src-zero_functional-v0_0_6.owner = "zero-functional";
  inputs.src-zero_functional-v0_0_6.repo = "zero-functional";
  inputs.src-zero_functional-v0_0_6.ref = "refs/tags/v0.0.6";
  
  outputs = { self, nixpkgs, src-zero_functional-v0_0_6, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zero_functional-v0_0_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-zero_functional-v0_0_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}