{
  description = ''OAuth library for nim'';
  inputs.src-oauth-v0_4_1.flake = false;
  inputs.src-oauth-v0_4_1.type = "github";
  inputs.src-oauth-v0_4_1.owner = "CORDEA";
  inputs.src-oauth-v0_4_1.repo = "oauth";
  inputs.src-oauth-v0_4_1.ref = "refs/tags/v0.4.1";
  
  
  inputs."sha1".url = "path:../../../s/sha1";
  inputs."sha1".type = "github";
  inputs."sha1".owner = "riinr";
  inputs."sha1".repo = "flake-nimble";
  inputs."sha1".ref = "flake-pinning";
  inputs."sha1".dir = "nimpkgs/s/sha1";

  outputs = { self, nixpkgs, src-oauth-v0_4_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-oauth-v0_4_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-oauth-v0_4_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}