{
  description = ''Nim bindings for Godot Engine'';
  inputs.src-godot-v0_6_9.flake = false;
  inputs.src-godot-v0_6_9.type = "github";
  inputs.src-godot-v0_6_9.owner = "pragmagic";
  inputs.src-godot-v0_6_9.repo = "godot-nim";
  inputs.src-godot-v0_6_9.ref = "refs/tags/v0.6.9";
  
  
  inputs."compiler".url = "path:../../../c/compiler";
  inputs."compiler".type = "github";
  inputs."compiler".owner = "riinr";
  inputs."compiler".repo = "flake-nimble";
  inputs."compiler".ref = "flake-pinning";
  inputs."compiler".dir = "nimpkgs/c/compiler";

  outputs = { self, nixpkgs, src-godot-v0_6_9, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-godot-v0_6_9;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-godot-v0_6_9"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}