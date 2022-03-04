{
  description = ''High-level and low-level wrapper for OpenGL'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-opengl-master.flake = false;
  inputs.src-opengl-master.type = "github";
  inputs.src-opengl-master.owner = "nim-lang";
  inputs.src-opengl-master.repo = "opengl";
  inputs.src-opengl-master.ref = "refs/heads/master";
  inputs.src-opengl-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."x11".type = "github";
  inputs."x11".owner = "riinr";
  inputs."x11".repo = "flake-nimble";
  inputs."x11".ref = "flake-pinning";
  inputs."x11".dir = "nimpkgs/x/x11";
  inputs."x11".inputs.nixpkgs.follows = "nixpkgs";
  inputs."x11".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-opengl-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-opengl-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-opengl-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}