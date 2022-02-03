{
  description = ''micro and elegant web framework'';
  inputs.src-scorper-v1_0_17.flake = false;
  inputs.src-scorper-v1_0_17.type = "github";
  inputs.src-scorper-v1_0_17.owner = "bung87";
  inputs.src-scorper-v1_0_17.repo = "scorper";
  inputs.src-scorper-v1_0_17.ref = "refs/tags/v1.0.17";
  
  
  inputs."chronos".url = "path:../../../c/chronos";
  inputs."chronos".type = "github";
  inputs."chronos".owner = "riinr";
  inputs."chronos".repo = "flake-nimble";
  inputs."chronos".ref = "flake-pinning";
  inputs."chronos".dir = "nimpkgs/c/chronos";

  
  inputs."npeg".url = "path:../../../n/npeg";
  inputs."npeg".type = "github";
  inputs."npeg".owner = "riinr";
  inputs."npeg".repo = "flake-nimble";
  inputs."npeg".ref = "flake-pinning";
  inputs."npeg".dir = "nimpkgs/n/npeg";

  
  inputs."zippy".url = "path:../../../z/zippy";
  inputs."zippy".type = "github";
  inputs."zippy".owner = "riinr";
  inputs."zippy".repo = "flake-nimble";
  inputs."zippy".ref = "flake-pinning";
  inputs."zippy".dir = "nimpkgs/z/zippy";

  
  inputs."jsony".url = "path:../../../j/jsony";
  inputs."jsony".type = "github";
  inputs."jsony".owner = "riinr";
  inputs."jsony".repo = "flake-nimble";
  inputs."jsony".ref = "flake-pinning";
  inputs."jsony".dir = "nimpkgs/j/jsony";

  
  inputs."result".url = "path:../../../r/result";
  inputs."result".type = "github";
  inputs."result".owner = "riinr";
  inputs."result".repo = "flake-nimble";
  inputs."result".ref = "flake-pinning";
  inputs."result".dir = "nimpkgs/r/result";

  
  inputs."asynctest".url = "path:../../../a/asynctest";
  inputs."asynctest".type = "github";
  inputs."asynctest".owner = "riinr";
  inputs."asynctest".repo = "flake-nimble";
  inputs."asynctest".ref = "flake-pinning";
  inputs."asynctest".dir = "nimpkgs/a/asynctest";

  outputs = { self, nixpkgs, src-scorper-v1_0_17, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-scorper-v1_0_17;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-scorper-v1_0_17"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}