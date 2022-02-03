{
  description = ''Fonts, Typesetting and Rasterization.'';
  inputs.src-typography-0_3_3.flake = false;
  inputs.src-typography-0_3_3.type = "github";
  inputs.src-typography-0_3_3.owner = "treeform";
  inputs.src-typography-0_3_3.repo = "typography";
  inputs.src-typography-0_3_3.ref = "refs/tags/0.3.3";
  
  
  inputs."flippy".url = "path:../../../f/flippy";
  inputs."flippy".type = "github";
  inputs."flippy".owner = "riinr";
  inputs."flippy".repo = "flake-nimble";
  inputs."flippy".ref = "flake-pinning";
  inputs."flippy".dir = "nimpkgs/f/flippy";

  
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

  outputs = { self, nixpkgs, src-typography-0_3_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-typography-0_3_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-typography-0_3_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}