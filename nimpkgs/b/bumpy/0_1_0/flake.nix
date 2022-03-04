{
  description = ''2d collision library for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-bumpy-0_1_0.flake = false;
  inputs.src-bumpy-0_1_0.type = "github";
  inputs.src-bumpy-0_1_0.owner = "treeform";
  inputs.src-bumpy-0_1_0.repo = "bumpy";
  inputs.src-bumpy-0_1_0.ref = "refs/tags/0.1.0";
  inputs.src-bumpy-0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."vmath".type = "github";
  inputs."vmath".owner = "riinr";
  inputs."vmath".repo = "flake-nimble";
  inputs."vmath".ref = "flake-pinning";
  inputs."vmath".dir = "nimpkgs/v/vmath";
  inputs."vmath".inputs.nixpkgs.follows = "nixpkgs";
  inputs."vmath".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-bumpy-0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bumpy-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-bumpy-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}