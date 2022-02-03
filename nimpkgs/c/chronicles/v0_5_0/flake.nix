{
  description = ''A crafty implementation of structured logging for Nim'';
  inputs.src-chronicles-v0_5_0.flake = false;
  inputs.src-chronicles-v0_5_0.type = "github";
  inputs.src-chronicles-v0_5_0.owner = "status-im";
  inputs.src-chronicles-v0_5_0.repo = "nim-chronicles";
  inputs.src-chronicles-v0_5_0.ref = "refs/tags/v0.5.0";
  
  
  inputs."json_serialization".url = "path:../../../j/json_serialization";
  inputs."json_serialization".type = "github";
  inputs."json_serialization".owner = "riinr";
  inputs."json_serialization".repo = "flake-nimble";
  inputs."json_serialization".ref = "flake-pinning";
  inputs."json_serialization".dir = "nimpkgs/j/json_serialization";

  outputs = { self, nixpkgs, src-chronicles-v0_5_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-chronicles-v0_5_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-chronicles-v0_5_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}