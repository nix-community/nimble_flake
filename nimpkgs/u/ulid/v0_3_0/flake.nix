{
  description = ''Universally Unique Lexicographically Sortable Identifier'';
  inputs.src-ulid-v0_3_0.flake = false;
  inputs.src-ulid-v0_3_0.type = "github";
  inputs.src-ulid-v0_3_0.owner = "adelq";
  inputs.src-ulid-v0_3_0.repo = "ulid";
  inputs.src-ulid-v0_3_0.ref = "refs/tags/v0.3.0";
  
  
  inputs."random".url = "path:../../../r/random";
  inputs."random".type = "github";
  inputs."random".owner = "riinr";
  inputs."random".repo = "flake-nimble";
  inputs."random".ref = "flake-pinning";
  inputs."random".dir = "nimpkgs/r/random";

  outputs = { self, nixpkgs, src-ulid-v0_3_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ulid-v0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-ulid-v0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}