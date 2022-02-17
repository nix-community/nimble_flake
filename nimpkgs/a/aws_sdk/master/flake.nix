{
  description = ''Library for interacting with Amazon Web Services (AWS)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-aws_sdk-master.flake = false;
  inputs.src-aws_sdk-master.type = "github";
  inputs.src-aws_sdk-master.owner = "aidansteele";
  inputs.src-aws_sdk-master.repo = "aws_sdk.nim";
  inputs.src-aws_sdk-master.ref = "refs/heads/master";
  
  
  inputs."stringinterpolation".type = "github";
  inputs."stringinterpolation".owner = "riinr";
  inputs."stringinterpolation".repo = "flake-nimble";
  inputs."stringinterpolation".ref = "flake-pinning";
  inputs."stringinterpolation".dir = "nimpkgs/s/stringinterpolation";

  
  inputs."sph".type = "github";
  inputs."sph".owner = "riinr";
  inputs."sph".repo = "flake-nimble";
  inputs."sph".ref = "flake-pinning";
  inputs."sph".dir = "nimpkgs/s/sph";

  outputs = { self, nixpkgs, flakeNimbleLib, src-aws_sdk-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-aws_sdk-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-aws_sdk-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}