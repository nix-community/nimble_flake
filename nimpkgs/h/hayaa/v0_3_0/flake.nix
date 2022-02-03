{
  description = ''Conway's Game of Life implemented in Nim'';
  inputs.src-hayaa-v0_3_0.flake = false;
  inputs.src-hayaa-v0_3_0.type = "github";
  inputs.src-hayaa-v0_3_0.owner = "angus-lherrou";
  inputs.src-hayaa-v0_3_0.repo = "hayaa";
  inputs.src-hayaa-v0_3_0.ref = "refs/tags/v0.3.0";
  
  
  inputs."illwill".url = "path:../../../i/illwill";
  inputs."illwill".type = "github";
  inputs."illwill".owner = "riinr";
  inputs."illwill".repo = "flake-nimble";
  inputs."illwill".ref = "flake-pinning";
  inputs."illwill".dir = "nimpkgs/i/illwill";

  outputs = { self, nixpkgs, src-hayaa-v0_3_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hayaa-v0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-hayaa-v0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}