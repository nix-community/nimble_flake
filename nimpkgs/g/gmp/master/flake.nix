{
  description = ''wrapper for the GNU multiple precision arithmetic library (GMP)'';
  inputs.src-gmp-master.flake = false;
  inputs.src-gmp-master.type = "github";
  inputs.src-gmp-master.owner = "subsetpark";
  inputs.src-gmp-master.repo = "nim-gmp";
  inputs.src-gmp-master.ref = "refs/heads/master";
  
  
  inputs."nimrod".url = "path:../../../n/nimrod";
  inputs."nimrod".type = "github";
  inputs."nimrod".owner = "riinr";
  inputs."nimrod".repo = "flake-nimble";
  inputs."nimrod".ref = "flake-pinning";
  inputs."nimrod".dir = "nimpkgs/n/nimrod";

  outputs = { self, nixpkgs, src-gmp-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gmp-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-gmp-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}