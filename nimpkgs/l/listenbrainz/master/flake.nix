{
  description = ''Low-level multisync bindings to the ListenBrainz web API.'';
  inputs.src-listenbrainz-master.flake = false;
  inputs.src-listenbrainz-master.type = "gitlab";
  inputs.src-listenbrainz-master.owner = "tandy1000";
  inputs.src-listenbrainz-master.repo = "listenbrainz-nim";
  inputs.src-listenbrainz-master.ref = "refs/heads/master";
  
  
  inputs."jsony".url = "path:../../../j/jsony";
  inputs."jsony".type = "github";
  inputs."jsony".owner = "riinr";
  inputs."jsony".repo = "flake-nimble";
  inputs."jsony".ref = "flake-pinning";
  inputs."jsony".dir = "nimpkgs/j/jsony";

  
  inputs."nodejs".url = "path:../../../n/nodejs";
  inputs."nodejs".type = "github";
  inputs."nodejs".owner = "riinr";
  inputs."nodejs".repo = "flake-nimble";
  inputs."nodejs".ref = "flake-pinning";
  inputs."nodejs".dir = "nimpkgs/n/nodejs";

  
  inputs."https://github.com/alaviss/union".url = "path:../../../h/https://github.com/alaviss/union";
  inputs."https://github.com/alaviss/union".type = "github";
  inputs."https://github.com/alaviss/union".owner = "riinr";
  inputs."https://github.com/alaviss/union".repo = "flake-nimble";
  inputs."https://github.com/alaviss/union".ref = "flake-pinning";
  inputs."https://github.com/alaviss/union".dir = "nimpkgs/h/https://github.com/alaviss/union";

  
  inputs."https://github.com/tandy-1000/uniony".url = "path:../../../h/https://github.com/tandy-1000/uniony";
  inputs."https://github.com/tandy-1000/uniony".type = "github";
  inputs."https://github.com/tandy-1000/uniony".owner = "riinr";
  inputs."https://github.com/tandy-1000/uniony".repo = "flake-nimble";
  inputs."https://github.com/tandy-1000/uniony".ref = "flake-pinning";
  inputs."https://github.com/tandy-1000/uniony".dir = "nimpkgs/h/https://github.com/tandy-1000/uniony";

  outputs = { self, nixpkgs, src-listenbrainz-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-listenbrainz-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-listenbrainz-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}