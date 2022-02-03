{
  description = ''Simple library to draw stuff on a window'';
  inputs.src-drawim-0_1_2.flake = false;
  inputs.src-drawim-0_1_2.type = "github";
  inputs.src-drawim-0_1_2.owner = "GabrielLasso";
  inputs.src-drawim-0_1_2.repo = "drawim";
  inputs.src-drawim-0_1_2.ref = "refs/tags/0.1.2";
  
  
  inputs."staticglfw".url = "path:../../../s/staticglfw";
  inputs."staticglfw".type = "github";
  inputs."staticglfw".owner = "riinr";
  inputs."staticglfw".repo = "flake-nimble";
  inputs."staticglfw".ref = "flake-pinning";
  inputs."staticglfw".dir = "nimpkgs/s/staticglfw";

  
  inputs."opengl".url = "path:../../../o/opengl";
  inputs."opengl".type = "github";
  inputs."opengl".owner = "riinr";
  inputs."opengl".repo = "flake-nimble";
  inputs."opengl".ref = "flake-pinning";
  inputs."opengl".dir = "nimpkgs/o/opengl";

  
  inputs."jscanvas".url = "path:../../../j/jscanvas";
  inputs."jscanvas".type = "github";
  inputs."jscanvas".owner = "riinr";
  inputs."jscanvas".repo = "flake-nimble";
  inputs."jscanvas".ref = "flake-pinning";
  inputs."jscanvas".dir = "nimpkgs/j/jscanvas";

  outputs = { self, nixpkgs, src-drawim-0_1_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-drawim-0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-drawim-0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}