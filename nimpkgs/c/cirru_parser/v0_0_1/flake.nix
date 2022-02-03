{
  description = ''Parser for Cirru syntax'';
  inputs.src-cirru_parser-v0_0_1.flake = false;
  inputs.src-cirru_parser-v0_0_1.type = "github";
  inputs.src-cirru_parser-v0_0_1.owner = "Cirru";
  inputs.src-cirru_parser-v0_0_1.repo = "parser.nim";
  inputs.src-cirru_parser-v0_0_1.ref = "refs/tags/v0.0.1";
  
  outputs = { self, nixpkgs, src-cirru_parser-v0_0_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cirru_parser-v0_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cirru_parser-v0_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}