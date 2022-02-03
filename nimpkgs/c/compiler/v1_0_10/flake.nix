{
  description = ''Compiler package providing the compiler sources as a library.'';
  inputs.src-compiler-v1_0_10.flake = false;
  inputs.src-compiler-v1_0_10.type = "github";
  inputs.src-compiler-v1_0_10.owner = "nim-lang";
  inputs.src-compiler-v1_0_10.repo = "Nim";
  inputs.src-compiler-v1_0_10.ref = "refs/tags/v1.0.10";
  
  outputs = { self, nixpkgs, src-compiler-v1_0_10, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-compiler-v1_0_10;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-compiler-v1_0_10"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}