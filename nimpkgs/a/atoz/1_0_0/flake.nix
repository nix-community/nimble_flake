{
  description = ''Amazon Web Services (AWS) APIs'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-atoz-1_0_0.flake = false;
  inputs.src-atoz-1_0_0.type = "github";
  inputs.src-atoz-1_0_0.owner = "disruptek";
  inputs.src-atoz-1_0_0.repo = "atoz";
  inputs.src-atoz-1_0_0.ref = "refs/tags/1.0.0";
  
  
  inputs."openapi".type = "github";
  inputs."openapi".owner = "riinr";
  inputs."openapi".repo = "flake-nimble";
  inputs."openapi".ref = "flake-pinning";
  inputs."openapi".dir = "nimpkgs/o/openapi";

  
  inputs."sigv4".type = "github";
  inputs."sigv4".owner = "riinr";
  inputs."sigv4".repo = "flake-nimble";
  inputs."sigv4".ref = "flake-pinning";
  inputs."sigv4".dir = "nimpkgs/s/sigv4";

  outputs = { self, nixpkgs, flakeNimbleLib, src-atoz-1_0_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-atoz-1_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-atoz-1_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}