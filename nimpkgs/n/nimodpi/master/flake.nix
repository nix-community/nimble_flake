{
  description = ''oracle odpi-c wrapper for Nim'';
  inputs.src-nimodpi-master.flake = false;
  inputs.src-nimodpi-master.type = "github";
  inputs.src-nimodpi-master.owner = "mikra01";
  inputs.src-nimodpi-master.repo = "nimodpi";
  inputs.src-nimodpi-master.ref = "refs/heads/master";
  
  
  inputs."nimterop".url = "path:../../../n/nimterop";
  inputs."nimterop".type = "github";
  inputs."nimterop".owner = "riinr";
  inputs."nimterop".repo = "flake-nimble";
  inputs."nimterop".ref = "flake-pinning";
  inputs."nimterop".dir = "nimpkgs/n/nimterop";

  outputs = { self, nixpkgs, src-nimodpi-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimodpi-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimodpi-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}