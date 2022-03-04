{
  description = ''libarchive wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimarchive-v0_5_3.flake = false;
  inputs.src-nimarchive-v0_5_3.type = "github";
  inputs.src-nimarchive-v0_5_3.owner = "genotrance";
  inputs.src-nimarchive-v0_5_3.repo = "nimarchive";
  inputs.src-nimarchive-v0_5_3.ref = "refs/tags/v0.5.3";
  inputs.src-nimarchive-v0_5_3.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."nimterop".type = "github";
  inputs."nimterop".owner = "riinr";
  inputs."nimterop".repo = "flake-nimble";
  inputs."nimterop".ref = "flake-pinning";
  inputs."nimterop".dir = "nimpkgs/n/nimterop";
  inputs."nimterop".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimterop".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimarchive-v0_5_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimarchive-v0_5_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimarchive-v0_5_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}