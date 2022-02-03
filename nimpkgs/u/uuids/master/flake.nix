{
  description = ''UUID library for Nim'';
  inputs.src-uuids-master.flake = false;
  inputs.src-uuids-master.type = "github";
  inputs.src-uuids-master.owner = "pragmagic";
  inputs.src-uuids-master.repo = "uuids";
  inputs.src-uuids-master.ref = "refs/heads/master";
  
  
  inputs."isaac".url = "path:../../../i/isaac";
  inputs."isaac".type = "github";
  inputs."isaac".owner = "riinr";
  inputs."isaac".repo = "flake-nimble";
  inputs."isaac".ref = "flake-pinning";
  inputs."isaac".dir = "nimpkgs/i/isaac";

  outputs = { self, nixpkgs, src-uuids-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-uuids-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-uuids-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}