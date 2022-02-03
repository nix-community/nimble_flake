{
  description = ''Bindings for Closure Compiler web API.'';
  inputs.src-closure_compiler-v0_3.flake = false;
  inputs.src-closure_compiler-v0_3.type = "github";
  inputs.src-closure_compiler-v0_3.owner = "yglukhov";
  inputs.src-closure_compiler-v0_3.repo = "closure_compiler";
  inputs.src-closure_compiler-v0_3.ref = "refs/tags/v0.3";
  
  outputs = { self, nixpkgs, src-closure_compiler-v0_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-closure_compiler-v0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-closure_compiler-v0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}