{
  description = ''A tensor (multidimensional array) library for Nim'';
  inputs.src-arraymancer-v0_7_9.flake = false;
  inputs.src-arraymancer-v0_7_9.type = "github";
  inputs.src-arraymancer-v0_7_9.owner = "mratsim";
  inputs.src-arraymancer-v0_7_9.repo = "Arraymancer";
  inputs.src-arraymancer-v0_7_9.ref = "refs/tags/v0.7.9";
  
  
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

  
  inputs."stb_image".url = "path:../../../s/stb_image";
  inputs."stb_image".type = "github";
  inputs."stb_image".owner = "riinr";
  inputs."stb_image".repo = "flake-nimble";
  inputs."stb_image".ref = "flake-pinning";
  inputs."stb_image".dir = "nimpkgs/s/stb_image";

  
  inputs."zip".url = "path:../../../z/zip";
  inputs."zip".type = "github";
  inputs."zip".owner = "riinr";
  inputs."zip".repo = "flake-nimble";
  inputs."zip".ref = "flake-pinning";
  inputs."zip".dir = "nimpkgs/z/zip";

  
  inputs."untar".url = "path:../../../u/untar";
  inputs."untar".type = "github";
  inputs."untar".owner = "riinr";
  inputs."untar".repo = "flake-nimble";
  inputs."untar".ref = "flake-pinning";
  inputs."untar".dir = "nimpkgs/u/untar";

  outputs = { self, nixpkgs, src-arraymancer-v0_7_9, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-arraymancer-v0_7_9;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-arraymancer-v0_7_9"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}