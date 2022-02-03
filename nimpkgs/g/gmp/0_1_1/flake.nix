{
  description = ''wrapper for the GNU multiple precision arithmetic library (GMP)'';
  inputs.src-gmp-0_1_1.flake = false;
  inputs.src-gmp-0_1_1.type = "github";
  inputs.src-gmp-0_1_1.owner = "subsetpark";
  inputs.src-gmp-0_1_1.repo = "nim-gmp";
  inputs.src-gmp-0_1_1.ref = "refs/tags/0.1.1";
  
  outputs = { self, nixpkgs, src-gmp-0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gmp-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-gmp-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}