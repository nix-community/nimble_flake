{
  description = ''Compiler package providing the compiler sources as a library.'';
  inputs.src-compiler-v1_4_2.flake = false;
  inputs.src-compiler-v1_4_2.type = "github";
  inputs.src-compiler-v1_4_2.owner = "nim-lang";
  inputs.src-compiler-v1_4_2.repo = "Nim";
  inputs.src-compiler-v1_4_2.ref = "refs/tags/v1.4.2";
  
  outputs = { self, nixpkgs, src-compiler-v1_4_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-compiler-v1_4_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-compiler-v1_4_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}