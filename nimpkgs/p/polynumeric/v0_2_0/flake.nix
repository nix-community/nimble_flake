{
  description = ''Polynomial operations'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-polynumeric-v0_2_0.flake = false;
  inputs.src-polynumeric-v0_2_0.type = "github";
  inputs.src-polynumeric-v0_2_0.owner = "SciNim";
  inputs.src-polynumeric-v0_2_0.repo = "polynumeric";
  inputs.src-polynumeric-v0_2_0.ref = "refs/tags/v0.2.0";
  inputs.src-polynumeric-v0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."arraymancer".type = "github";
  inputs."arraymancer".owner = "riinr";
  inputs."arraymancer".repo = "flake-nimble";
  inputs."arraymancer".ref = "flake-pinning";
  inputs."arraymancer".dir = "nimpkgs/a/arraymancer";
  inputs."arraymancer".inputs.nixpkgs.follows = "nixpkgs";
  inputs."arraymancer".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-polynumeric-v0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-polynumeric-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-polynumeric-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}