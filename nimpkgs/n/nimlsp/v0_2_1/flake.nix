{
  description = ''Language Server Protocol implementation for Nim'';
  inputs.src-nimlsp-v0_2_1.flake = false;
  inputs.src-nimlsp-v0_2_1.type = "github";
  inputs.src-nimlsp-v0_2_1.owner = "PMunch";
  inputs.src-nimlsp-v0_2_1.repo = "nimlsp";
  inputs.src-nimlsp-v0_2_1.ref = "refs/tags/v0.2.1";
  
  
  inputs."astpatternmatching".url = "path:../../../a/astpatternmatching";
  inputs."astpatternmatching".type = "github";
  inputs."astpatternmatching".owner = "riinr";
  inputs."astpatternmatching".repo = "flake-nimble";
  inputs."astpatternmatching".ref = "flake-pinning";
  inputs."astpatternmatching".dir = "nimpkgs/a/astpatternmatching";

  
  inputs."jsonschema".url = "path:../../../j/jsonschema";
  inputs."jsonschema".type = "github";
  inputs."jsonschema".owner = "riinr";
  inputs."jsonschema".repo = "flake-nimble";
  inputs."jsonschema".ref = "flake-pinning";
  inputs."jsonschema".dir = "nimpkgs/j/jsonschema";

  outputs = { self, nixpkgs, src-nimlsp-v0_2_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimlsp-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimlsp-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}