{
  description = ''Extensible data notation based on Cirru syntax'';
  inputs.src-cirru_edn-v0_1_6.flake = false;
  inputs.src-cirru_edn-v0_1_6.type = "github";
  inputs.src-cirru_edn-v0_1_6.owner = "Cirru";
  inputs.src-cirru_edn-v0_1_6.repo = "cirru-edn.nim";
  inputs.src-cirru_edn-v0_1_6.ref = "refs/tags/v0.1.6";
  
  outputs = { self, nixpkgs, src-cirru_edn-v0_1_6, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cirru_edn-v0_1_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cirru_edn-v0_1_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}