{
  description = ''Extensible data notation based on Cirru syntax'';
  inputs.src-cirru_edn-v0_1_7.flake = false;
  inputs.src-cirru_edn-v0_1_7.type = "github";
  inputs.src-cirru_edn-v0_1_7.owner = "Cirru";
  inputs.src-cirru_edn-v0_1_7.repo = "cirru-edn.nim";
  inputs.src-cirru_edn-v0_1_7.ref = "refs/tags/v0.1.7";
  
  outputs = { self, nixpkgs, src-cirru_edn-v0_1_7, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cirru_edn-v0_1_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cirru_edn-v0_1_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}