{
  description = ''Extensible data notation based on Cirru syntax'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-cirru_edn-v0_3_2.flake = false;
  inputs.src-cirru_edn-v0_3_2.type = "github";
  inputs.src-cirru_edn-v0_3_2.owner = "Cirru";
  inputs.src-cirru_edn-v0_3_2.repo = "cirru-edn.nim";
  inputs.src-cirru_edn-v0_3_2.ref = "refs/tags/v0.3.2";
  inputs.src-cirru_edn-v0_3_2.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."cirru-parser".type = "github";
  inputs."cirru-parser".owner = "riinr";
  inputs."cirru-parser".repo = "flake-nimble";
  inputs."cirru-parser".ref = "flake-pinning";
  inputs."cirru-parser".dir = "nimpkgs/c/cirru-parser";
  inputs."cirru-parser".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cirru-parser".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-cirru_edn-v0_3_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cirru_edn-v0_3_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-cirru_edn-v0_3_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}