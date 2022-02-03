{
  description = ''Compiler package providing the compiler sources as a library.'';
  inputs.src-compiler-v1_2_12.flake = false;
  inputs.src-compiler-v1_2_12.type = "github";
  inputs.src-compiler-v1_2_12.owner = "nim-lang";
  inputs.src-compiler-v1_2_12.repo = "Nim";
  inputs.src-compiler-v1_2_12.ref = "refs/tags/v1.2.12";
  
  outputs = { self, nixpkgs, src-compiler-v1_2_12, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-compiler-v1_2_12;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-compiler-v1_2_12"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}