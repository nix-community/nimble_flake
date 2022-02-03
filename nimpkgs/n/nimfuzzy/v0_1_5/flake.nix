{
  description = ''Fuzzy search wrapper for Nim'';
  inputs.src-nimfuzzy-v0_1_5.flake = false;
  inputs.src-nimfuzzy-v0_1_5.type = "github";
  inputs.src-nimfuzzy-v0_1_5.owner = "genotrance";
  inputs.src-nimfuzzy-v0_1_5.repo = "nimfuzzy";
  inputs.src-nimfuzzy-v0_1_5.ref = "refs/tags/v0.1.5";
  
  
  inputs."nimgen".url = "path:../../../n/nimgen";
  inputs."nimgen".type = "github";
  inputs."nimgen".owner = "riinr";
  inputs."nimgen".repo = "flake-nimble";
  inputs."nimgen".ref = "flake-pinning";
  inputs."nimgen".dir = "nimpkgs/n/nimgen";

  outputs = { self, nixpkgs, src-nimfuzzy-v0_1_5, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimfuzzy-v0_1_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimfuzzy-v0_1_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}