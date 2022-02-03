{
  description = ''Extensible data notation based on Cirru syntax'';
  inputs.src-cirru_edn-v0_4_0.flake = false;
  inputs.src-cirru_edn-v0_4_0.type = "github";
  inputs.src-cirru_edn-v0_4_0.owner = "Cirru";
  inputs.src-cirru_edn-v0_4_0.repo = "cirru-edn.nim";
  inputs.src-cirru_edn-v0_4_0.ref = "refs/tags/v0.4.0";
  
  
  inputs."cirru_parser".url = "path:../../../c/cirru_parser";
  inputs."cirru_parser".type = "github";
  inputs."cirru_parser".owner = "riinr";
  inputs."cirru_parser".repo = "flake-nimble";
  inputs."cirru_parser".ref = "flake-pinning";
  inputs."cirru_parser".dir = "nimpkgs/c/cirru_parser";

  
  inputs."https://github.com/cirru/writer.nim".url = "path:../../../h/https://github.com/cirru/writer.nim";
  inputs."https://github.com/cirru/writer.nim".type = "github";
  inputs."https://github.com/cirru/writer.nim".owner = "riinr";
  inputs."https://github.com/cirru/writer.nim".repo = "flake-nimble";
  inputs."https://github.com/cirru/writer.nim".ref = "flake-pinning";
  inputs."https://github.com/cirru/writer.nim".dir = "nimpkgs/h/https://github.com/cirru/writer.nim";

  outputs = { self, nixpkgs, src-cirru_edn-v0_4_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cirru_edn-v0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-cirru_edn-v0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}