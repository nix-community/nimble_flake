{
  description = ''Language Handler for executing Nim inside postgres as a procedural language'';
  inputs.src-plnim-v0_1_0.flake = false;
  inputs.src-plnim-v0_1_0.type = "github";
  inputs.src-plnim-v0_1_0.owner = "luisacosta828";
  inputs.src-plnim-v0_1_0.repo = "plnim";
  inputs.src-plnim-v0_1_0.ref = "refs/tags/v0.1.0";
  
  
  inputs."pgxcrown".url = "path:../../../p/pgxcrown";
  inputs."pgxcrown".type = "github";
  inputs."pgxcrown".owner = "riinr";
  inputs."pgxcrown".repo = "flake-nimble";
  inputs."pgxcrown".ref = "flake-pinning";
  inputs."pgxcrown".dir = "nimpkgs/p/pgxcrown";

  outputs = { self, nixpkgs, src-plnim-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-plnim-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-plnim-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}