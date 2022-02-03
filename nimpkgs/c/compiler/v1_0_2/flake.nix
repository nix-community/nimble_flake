{
  description = ''Compiler package providing the compiler sources as a library.'';
  inputs.src-compiler-v1_0_2.flake = false;
  inputs.src-compiler-v1_0_2.type = "github";
  inputs.src-compiler-v1_0_2.owner = "nim-lang";
  inputs.src-compiler-v1_0_2.repo = "Nim";
  inputs.src-compiler-v1_0_2.ref = "refs/tags/v1.0.2";
  
  outputs = { self, nixpkgs, src-compiler-v1_0_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-compiler-v1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-compiler-v1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}