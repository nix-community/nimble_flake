{
  description = ''WIP strongly-typed argument parser with sub command support'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-argparse-v0_8_3.flake = false;
  inputs.src-argparse-v0_8_3.type = "github";
  inputs.src-argparse-v0_8_3.owner = "iffy";
  inputs.src-argparse-v0_8_3.repo = "nim-argparse";
  inputs.src-argparse-v0_8_3.ref = "refs/tags/v0.8.3";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-argparse-v0_8_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-argparse-v0_8_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-argparse-v0_8_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}