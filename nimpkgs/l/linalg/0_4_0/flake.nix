{
  description = ''Linear algebra for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-linalg-0_4_0.flake = false;
  inputs.src-linalg-0_4_0.type = "github";
  inputs.src-linalg-0_4_0.owner = "andreaferretti";
  inputs.src-linalg-0_4_0.repo = "linear-algebra";
  inputs.src-linalg-0_4_0.ref = "refs/tags/0.4.0";
  inputs.src-linalg-0_4_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."nimblas".type = "github";
  inputs."nimblas".owner = "riinr";
  inputs."nimblas".repo = "flake-nimble";
  inputs."nimblas".ref = "flake-pinning";
  inputs."nimblas".dir = "nimpkgs/n/nimblas";
  inputs."nimblas".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimblas".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-linalg-0_4_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-linalg-0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-linalg-0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}