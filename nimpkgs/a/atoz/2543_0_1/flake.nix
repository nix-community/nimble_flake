{
  description = ''Amazon Web Services (AWS) APIs'';
  inputs.src-atoz-2543_0_1.flake = false;
  inputs.src-atoz-2543_0_1.type = "github";
  inputs.src-atoz-2543_0_1.owner = "disruptek";
  inputs.src-atoz-2543_0_1.repo = "atoz";
  inputs.src-atoz-2543_0_1.ref = "refs/tags/2543.0.1";
  
  
  inputs."openapi".url = "path:../../../o/openapi";
  inputs."openapi".type = "github";
  inputs."openapi".owner = "riinr";
  inputs."openapi".repo = "flake-nimble";
  inputs."openapi".ref = "flake-pinning";
  inputs."openapi".dir = "nimpkgs/o/openapi";

  
  inputs."sigv4".url = "path:../../../s/sigv4";
  inputs."sigv4".type = "github";
  inputs."sigv4".owner = "riinr";
  inputs."sigv4".repo = "flake-nimble";
  inputs."sigv4".ref = "flake-pinning";
  inputs."sigv4".dir = "nimpkgs/s/sigv4";

  
  inputs."https://github.com/disruptek/rest.git".url = "path:../../../h/https://github.com/disruptek/rest.git";
  inputs."https://github.com/disruptek/rest.git".type = "github";
  inputs."https://github.com/disruptek/rest.git".owner = "riinr";
  inputs."https://github.com/disruptek/rest.git".repo = "flake-nimble";
  inputs."https://github.com/disruptek/rest.git".ref = "flake-pinning";
  inputs."https://github.com/disruptek/rest.git".dir = "nimpkgs/h/https://github.com/disruptek/rest.git";

  outputs = { self, nixpkgs, src-atoz-2543_0_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-atoz-2543_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-atoz-2543_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}