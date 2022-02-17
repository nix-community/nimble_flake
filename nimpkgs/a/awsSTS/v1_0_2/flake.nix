{
  description = ''AWS Security Token Service API in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-awsSTS-v1_0_2.flake = false;
  inputs.src-awsSTS-v1_0_2.type = "github";
  inputs.src-awsSTS-v1_0_2.owner = "ThomasTJdev";
  inputs.src-awsSTS-v1_0_2.repo = "nim_awsSTS";
  inputs.src-awsSTS-v1_0_2.ref = "refs/tags/v1.0.2";
  
  
  inputs."sigv4".type = "github";
  inputs."sigv4".owner = "riinr";
  inputs."sigv4".repo = "flake-nimble";
  inputs."sigv4".ref = "flake-pinning";
  inputs."sigv4".dir = "nimpkgs/s/sigv4";

  outputs = { self, nixpkgs, flakeNimbleLib, src-awsSTS-v1_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-awsSTS-v1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-awsSTS-v1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}