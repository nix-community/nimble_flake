{
  description = ''Surfing is a highly functional CLI for Base64.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-surfing-ver_0_1_0.flake = false;
  inputs.src-surfing-ver_0_1_0.type = "github";
  inputs.src-surfing-ver_0_1_0.owner = "momeemt";
  inputs.src-surfing-ver_0_1_0.repo = "surfing";
  inputs.src-surfing-ver_0_1_0.ref = "refs/tags/ver.0.1.0";
  inputs.src-surfing-ver_0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";
  inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-surfing-ver_0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-surfing-ver_0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-surfing-ver_0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}