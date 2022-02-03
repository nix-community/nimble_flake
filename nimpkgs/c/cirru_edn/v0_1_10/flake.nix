{
  description = ''Extensible data notation based on Cirru syntax'';
  inputs.src-cirru_edn-v0_1_10.flake = false;
  inputs.src-cirru_edn-v0_1_10.type = "github";
  inputs.src-cirru_edn-v0_1_10.owner = "Cirru";
  inputs.src-cirru_edn-v0_1_10.repo = "cirru-edn.nim";
  inputs.src-cirru_edn-v0_1_10.ref = "refs/tags/v0.1.10";
  
  outputs = { self, nixpkgs, src-cirru_edn-v0_1_10, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cirru_edn-v0_1_10;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cirru_edn-v0_1_10"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}