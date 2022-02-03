{
  description = ''Engine-agnostic library for computing 2D raycasted lights'';
  inputs.src-delight-0_1_0.flake = false;
  inputs.src-delight-0_1_0.type = "github";
  inputs.src-delight-0_1_0.owner = "liquid600pgm";
  inputs.src-delight-0_1_0.repo = "delight";
  inputs.src-delight-0_1_0.ref = "refs/tags/0.1.0";
  
  
  inputs."glm".url = "path:../../../g/glm";
  inputs."glm".type = "github";
  inputs."glm".owner = "riinr";
  inputs."glm".repo = "flake-nimble";
  inputs."glm".ref = "flake-pinning";
  inputs."glm".dir = "nimpkgs/g/glm";

  outputs = { self, nixpkgs, src-delight-0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-delight-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-delight-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}