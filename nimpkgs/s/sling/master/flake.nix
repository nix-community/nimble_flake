{
  description = ''Signal and Slot library for Nim.'';
  inputs.src-sling-master.flake = false;
  inputs.src-sling-master.type = "github";
  inputs.src-sling-master.owner = "Druage";
  inputs.src-sling-master.repo = "sling";
  inputs.src-sling-master.ref = "refs/heads/master";
  
  
  inputs."nimrod".url = "path:../../../n/nimrod";
  inputs."nimrod".type = "github";
  inputs."nimrod".owner = "riinr";
  inputs."nimrod".repo = "flake-nimble";
  inputs."nimrod".ref = "flake-pinning";
  inputs."nimrod".dir = "nimpkgs/n/nimrod";

  outputs = { self, nixpkgs, src-sling-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sling-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-sling-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}