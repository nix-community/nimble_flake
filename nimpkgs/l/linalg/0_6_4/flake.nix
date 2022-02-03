{
  description = ''Linear algebra for Nim'';
  inputs.src-linalg-0_6_4.flake = false;
  inputs.src-linalg-0_6_4.type = "github";
  inputs.src-linalg-0_6_4.owner = "andreaferretti";
  inputs.src-linalg-0_6_4.repo = "linear-algebra";
  inputs.src-linalg-0_6_4.ref = "refs/tags/0.6.4";
  
  
  inputs."nimblas".url = "path:../../../n/nimblas";
  inputs."nimblas".type = "github";
  inputs."nimblas".owner = "riinr";
  inputs."nimblas".repo = "flake-nimble";
  inputs."nimblas".ref = "flake-pinning";
  inputs."nimblas".dir = "nimpkgs/n/nimblas";

  outputs = { self, nixpkgs, src-linalg-0_6_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-linalg-0_6_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-linalg-0_6_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}