{
  description = ''A tensor (multidimensional array) library for Nim'';
  inputs.src-arraymancer-v0_4_0.flake = false;
  inputs.src-arraymancer-v0_4_0.type = "github";
  inputs.src-arraymancer-v0_4_0.owner = "mratsim";
  inputs.src-arraymancer-v0_4_0.repo = "Arraymancer";
  inputs.src-arraymancer-v0_4_0.ref = "refs/tags/v0.4.0";
  
  
  inputs."nimblas".url = "path:../../../n/nimblas";
  inputs."nimblas".type = "github";
  inputs."nimblas".owner = "riinr";
  inputs."nimblas".repo = "flake-nimble";
  inputs."nimblas".ref = "flake-pinning";
  inputs."nimblas".dir = "nimpkgs/n/nimblas";

  
  inputs."nimlapack".url = "path:../../../n/nimlapack";
  inputs."nimlapack".type = "github";
  inputs."nimlapack".owner = "riinr";
  inputs."nimlapack".repo = "flake-nimble";
  inputs."nimlapack".ref = "flake-pinning";
  inputs."nimlapack".dir = "nimpkgs/n/nimlapack";

  
  inputs."nimcuda".url = "path:../../../n/nimcuda";
  inputs."nimcuda".type = "github";
  inputs."nimcuda".owner = "riinr";
  inputs."nimcuda".repo = "flake-nimble";
  inputs."nimcuda".ref = "flake-pinning";
  inputs."nimcuda".dir = "nimpkgs/n/nimcuda";

  
  inputs."nimcl".url = "path:../../../n/nimcl";
  inputs."nimcl".type = "github";
  inputs."nimcl".owner = "riinr";
  inputs."nimcl".repo = "flake-nimble";
  inputs."nimcl".ref = "flake-pinning";
  inputs."nimcl".dir = "nimpkgs/n/nimcl";

  
  inputs."clblast".url = "path:../../../c/clblast";
  inputs."clblast".type = "github";
  inputs."clblast".owner = "riinr";
  inputs."clblast".repo = "flake-nimble";
  inputs."clblast".ref = "flake-pinning";
  inputs."clblast".dir = "nimpkgs/c/clblast";

  outputs = { self, nixpkgs, src-arraymancer-v0_4_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-arraymancer-v0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-arraymancer-v0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}