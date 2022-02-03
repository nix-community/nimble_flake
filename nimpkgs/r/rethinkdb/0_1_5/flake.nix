{
  description = ''RethinkDB driver for Nim'';
  inputs.src-rethinkdb-0_1_5.flake = false;
  inputs.src-rethinkdb-0_1_5.type = "github";
  inputs.src-rethinkdb-0_1_5.owner = "OpenSystemsLab";
  inputs.src-rethinkdb-0_1_5.repo = "rethinkdb.nim";
  inputs.src-rethinkdb-0_1_5.ref = "refs/tags/0.1.5";
  
  
  inputs."struct".url = "path:../../../s/struct";
  inputs."struct".type = "github";
  inputs."struct".owner = "riinr";
  inputs."struct".repo = "flake-nimble";
  inputs."struct".ref = "flake-pinning";
  inputs."struct".dir = "nimpkgs/s/struct";

  outputs = { self, nixpkgs, src-rethinkdb-0_1_5, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rethinkdb-0_1_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-rethinkdb-0_1_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}