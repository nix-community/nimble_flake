{
  description = ''The parsesql module implements a high performance SQL file parser. It parses PostgreSQL syntax and the SQL ANSI standard.'';
  inputs.src-parsesql-v0_1_1.flake = false;
  inputs.src-parsesql-v0_1_1.type = "github";
  inputs.src-parsesql-v0_1_1.owner = "bung87";
  inputs.src-parsesql-v0_1_1.repo = "parsesql";
  inputs.src-parsesql-v0_1_1.ref = "refs/tags/v0.1.1";
  
  outputs = { self, nixpkgs, src-parsesql-v0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-parsesql-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-parsesql-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}