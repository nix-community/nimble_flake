{
  description = ''Create memorable sentences from byte sequences.'';
  inputs.src-mnemonic-v0_1_0.flake = false;
  inputs.src-mnemonic-v0_1_0.type = "github";
  inputs.src-mnemonic-v0_1_0.owner = "markspanbroek";
  inputs.src-mnemonic-v0_1_0.repo = "mnemonic";
  inputs.src-mnemonic-v0_1_0.ref = "refs/tags/v0.1.0";
  
  
  inputs."nimsha2".url = "path:../../../n/nimsha2";
  inputs."nimsha2".type = "github";
  inputs."nimsha2".owner = "riinr";
  inputs."nimsha2".repo = "flake-nimble";
  inputs."nimsha2".ref = "flake-pinning";
  inputs."nimsha2".dir = "nimpkgs/n/nimsha2";

  outputs = { self, nixpkgs, src-mnemonic-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mnemonic-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-mnemonic-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}