{
  description = ''libxslxwriter wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimlibxlsxwriter-v0_1_2.flake = false;
  inputs.src-nimlibxlsxwriter-v0_1_2.type = "github";
  inputs.src-nimlibxlsxwriter-v0_1_2.owner = "ThomasTJdev";
  inputs.src-nimlibxlsxwriter-v0_1_2.repo = "nimlibxlsxwriter";
  inputs.src-nimlibxlsxwriter-v0_1_2.ref = "refs/tags/v0.1.2";
  inputs.src-nimlibxlsxwriter-v0_1_2.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."nimgen".type = "github";
  inputs."nimgen".owner = "riinr";
  inputs."nimgen".repo = "flake-nimble";
  inputs."nimgen".ref = "flake-pinning";
  inputs."nimgen".dir = "nimpkgs/n/nimgen";
  inputs."nimgen".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimgen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimlibxlsxwriter-v0_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimlibxlsxwriter-v0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimlibxlsxwriter-v0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}