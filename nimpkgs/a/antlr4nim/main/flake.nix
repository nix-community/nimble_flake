{
  description = ''Nim interface to ANTLR4 listener/visitor via jsffi'';
  inputs.src-antlr4nim-main.flake = false;
  inputs.src-antlr4nim-main.type = "github";
  inputs.src-antlr4nim-main.owner = "jan0sc";
  inputs.src-antlr4nim-main.repo = "antlr4nim";
  inputs.src-antlr4nim-main.ref = "refs/heads/main";
  
  outputs = { self, nixpkgs, src-antlr4nim-main, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-antlr4nim-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-antlr4nim-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}