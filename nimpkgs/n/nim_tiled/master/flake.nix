{
  description = ''Tiled map loader for the Nim programming language'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nim_tiled-master.flake = false;
  inputs.src-nim_tiled-master.type = "github";
  inputs.src-nim_tiled-master.owner = "SkyVault";
  inputs.src-nim_tiled-master.repo = "nim-tiled";
  inputs.src-nim_tiled-master.ref = "refs/heads/master";
  inputs.src-nim_tiled-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."zippy".type = "github";
  inputs."zippy".owner = "riinr";
  inputs."zippy".repo = "flake-nimble";
  inputs."zippy".ref = "flake-pinning";
  inputs."zippy".dir = "nimpkgs/z/zippy";
  inputs."zippy".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zippy".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nim_tiled-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nim_tiled-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nim_tiled-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}