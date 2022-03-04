{
  description = ''Nim wrappers for tree-sitter parser grammars'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-htsparse-0_1_12.flake = false;
  inputs.src-htsparse-0_1_12.type = "github";
  inputs.src-htsparse-0_1_12.owner = "haxscramper";
  inputs.src-htsparse-0_1_12.repo = "htsparse";
  inputs.src-htsparse-0_1_12.ref = "refs/tags/0.1.12";
  inputs.src-htsparse-0_1_12.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."hmisc".type = "github";
  inputs."hmisc".owner = "riinr";
  inputs."hmisc".repo = "flake-nimble";
  inputs."hmisc".ref = "flake-pinning";
  inputs."hmisc".dir = "nimpkgs/h/hmisc";
  inputs."hmisc".inputs.nixpkgs.follows = "nixpkgs";
  inputs."hmisc".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-htsparse-0_1_12, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-htsparse-0_1_12;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-htsparse-0_1_12"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}