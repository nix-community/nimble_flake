{
  description = ''Bindings for libspnav, the free 3Dconnexion device driver'';
  inputs.src-spacenav-master.flake = false;
  inputs.src-spacenav-master.type = "github";
  inputs.src-spacenav-master.owner = "nimious";
  inputs.src-spacenav-master.repo = "spacenav";
  inputs.src-spacenav-master.ref = "refs/heads/master";
  
  
  inputs."nimrod".url = "path:../../../n/nimrod";
  inputs."nimrod".type = "github";
  inputs."nimrod".owner = "riinr";
  inputs."nimrod".repo = "flake-nimble";
  inputs."nimrod".ref = "flake-pinning";
  inputs."nimrod".dir = "nimpkgs/n/nimrod";

  outputs = { self, nixpkgs, src-spacenav-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-spacenav-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-spacenav-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}