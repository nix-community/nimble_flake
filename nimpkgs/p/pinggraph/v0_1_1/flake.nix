{
  description = ''Simple terminal ping graph'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-pinggraph-v0_1_1.flake = false;
  inputs.src-pinggraph-v0_1_1.type = "github";
  inputs.src-pinggraph-v0_1_1.owner = "SolitudeSF";
  inputs.src-pinggraph-v0_1_1.repo = "pinggraph";
  inputs.src-pinggraph-v0_1_1.ref = "refs/tags/v0.1.1";
  inputs.src-pinggraph-v0_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";
  inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-pinggraph-v0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pinggraph-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-pinggraph-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}