{
  description = ''Fonts, Typesetting and Rasterization.'';
  inputs.src-typography-0_7_1.flake = false;
  inputs.src-typography-0_7_1.type = "github";
  inputs.src-typography-0_7_1.owner = "treeform";
  inputs.src-typography-0_7_1.repo = "typography";
  inputs.src-typography-0_7_1.ref = "refs/tags/0.7.1";
  
  
  inputs."pixie".url = "path:../../../p/pixie";
  inputs."pixie".type = "github";
  inputs."pixie".owner = "riinr";
  inputs."pixie".repo = "flake-nimble";
  inputs."pixie".ref = "flake-pinning";
  inputs."pixie".dir = "nimpkgs/p/pixie";

  
  inputs."vmath".url = "path:../../../v/vmath";
  inputs."vmath".type = "github";
  inputs."vmath".owner = "riinr";
  inputs."vmath".repo = "flake-nimble";
  inputs."vmath".ref = "flake-pinning";
  inputs."vmath".dir = "nimpkgs/v/vmath";

  
  inputs."chroma".url = "path:../../../c/chroma";
  inputs."chroma".type = "github";
  inputs."chroma".owner = "riinr";
  inputs."chroma".repo = "flake-nimble";
  inputs."chroma".ref = "flake-pinning";
  inputs."chroma".dir = "nimpkgs/c/chroma";

  
  inputs."print".url = "path:../../../p/print";
  inputs."print".type = "github";
  inputs."print".owner = "riinr";
  inputs."print".repo = "flake-nimble";
  inputs."print".ref = "flake-pinning";
  inputs."print".dir = "nimpkgs/p/print";

  
  inputs."bumpy".url = "path:../../../b/bumpy";
  inputs."bumpy".type = "github";
  inputs."bumpy".owner = "riinr";
  inputs."bumpy".repo = "flake-nimble";
  inputs."bumpy".ref = "flake-pinning";
  inputs."bumpy".dir = "nimpkgs/b/bumpy";

  outputs = { self, nixpkgs, src-typography-0_7_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-typography-0_7_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-typography-0_7_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}