{
  description = ''A Nim IDE.'';
  inputs.src-aporia-v0_4_0.flake = false;
  inputs.src-aporia-v0_4_0.type = "github";
  inputs.src-aporia-v0_4_0.owner = "nim-lang";
  inputs.src-aporia-v0_4_0.repo = "Aporia";
  inputs.src-aporia-v0_4_0.ref = "refs/tags/v0.4.0";
  
  
  inputs."gtk2".url = "path:../../../g/gtk2";
  inputs."gtk2".type = "github";
  inputs."gtk2".owner = "riinr";
  inputs."gtk2".repo = "flake-nimble";
  inputs."gtk2".ref = "flake-pinning";
  inputs."gtk2".dir = "nimpkgs/g/gtk2";

  
  inputs."dialogs".url = "path:../../../d/dialogs";
  inputs."dialogs".type = "github";
  inputs."dialogs".owner = "riinr";
  inputs."dialogs".repo = "flake-nimble";
  inputs."dialogs".ref = "flake-pinning";
  inputs."dialogs".dir = "nimpkgs/d/dialogs";

  outputs = { self, nixpkgs, src-aporia-v0_4_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-aporia-v0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-aporia-v0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}