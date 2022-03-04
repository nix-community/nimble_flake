{
  description = ''Unicode normalization forms (tr15)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-normalize-v0_5_0.flake = false;
  inputs.src-normalize-v0_5_0.type = "github";
  inputs.src-normalize-v0_5_0.owner = "nitely";
  inputs.src-normalize-v0_5_0.repo = "nim-normalize";
  inputs.src-normalize-v0_5_0.ref = "refs/tags/v0.5.0";
  inputs.src-normalize-v0_5_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."unicodedb".type = "github";
  inputs."unicodedb".owner = "riinr";
  inputs."unicodedb".repo = "flake-nimble";
  inputs."unicodedb".ref = "flake-pinning";
  inputs."unicodedb".dir = "nimpkgs/u/unicodedb";
  inputs."unicodedb".inputs.nixpkgs.follows = "nixpkgs";
  inputs."unicodedb".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-normalize-v0_5_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-normalize-v0_5_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-normalize-v0_5_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}