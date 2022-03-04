{
  description = ''A crafty implementation of structured logging for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-chronicles-v0_5_3.flake = false;
  inputs.src-chronicles-v0_5_3.type = "github";
  inputs.src-chronicles-v0_5_3.owner = "status-im";
  inputs.src-chronicles-v0_5_3.repo = "nim-chronicles";
  inputs.src-chronicles-v0_5_3.ref = "refs/tags/v0.5.3";
  inputs.src-chronicles-v0_5_3.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."json_serialization".type = "github";
  inputs."json_serialization".owner = "riinr";
  inputs."json_serialization".repo = "flake-nimble";
  inputs."json_serialization".ref = "flake-pinning";
  inputs."json_serialization".dir = "nimpkgs/j/json_serialization";
  inputs."json_serialization".inputs.nixpkgs.follows = "nixpkgs";
  inputs."json_serialization".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-chronicles-v0_5_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-chronicles-v0_5_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-chronicles-v0_5_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}