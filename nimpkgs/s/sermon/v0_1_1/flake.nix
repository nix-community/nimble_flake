{
  description = ''Monitor the state and memory of processes and URL response.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-sermon-v0_1_1.flake = false;
  inputs.src-sermon-v0_1_1.type = "github";
  inputs.src-sermon-v0_1_1.owner = "ThomasTJdev";
  inputs.src-sermon-v0_1_1.repo = "nim_sermon";
  inputs.src-sermon-v0_1_1.ref = "refs/tags/v0.1.1";
  inputs.src-sermon-v0_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."jester".type = "github";
  inputs."jester".owner = "riinr";
  inputs."jester".repo = "flake-nimble";
  inputs."jester".ref = "flake-pinning";
  inputs."jester".dir = "nimpkgs/j/jester";
  inputs."jester".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jester".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-sermon-v0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sermon-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-sermon-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}