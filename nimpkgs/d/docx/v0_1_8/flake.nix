{
  description = ''A simple docx reader.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-docx-v0_1_8.flake = false;
  inputs.src-docx-v0_1_8.type = "github";
  inputs.src-docx-v0_1_8.owner = "xflywind";
  inputs.src-docx-v0_1_8.repo = "docx";
  inputs.src-docx-v0_1_8.ref = "refs/tags/v0.1.8";
  inputs.src-docx-v0_1_8.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."zip".type = "github";
  inputs."zip".owner = "riinr";
  inputs."zip".repo = "flake-nimble";
  inputs."zip".ref = "flake-pinning";
  inputs."zip".dir = "nimpkgs/z/zip";
  inputs."zip".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zip".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-docx-v0_1_8, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-docx-v0_1_8;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-docx-v0_1_8"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}