{
  description = ''Language Server Protocol implementation for Nim'';
  inputs.src-nimlsp-v0_4_0.flake = false;
  inputs.src-nimlsp-v0_4_0.type = "github";
  inputs.src-nimlsp-v0_4_0.owner = "PMunch";
  inputs.src-nimlsp-v0_4_0.repo = "nimlsp";
  inputs.src-nimlsp-v0_4_0.ref = "refs/tags/v0.4.0";
  
  
  inputs."jsonschema".url = "path:../../../j/jsonschema";
  inputs."jsonschema".type = "github";
  inputs."jsonschema".owner = "riinr";
  inputs."jsonschema".repo = "flake-nimble";
  inputs."jsonschema".ref = "flake-pinning";
  inputs."jsonschema".dir = "nimpkgs/j/jsonschema";

  outputs = { self, nixpkgs, src-nimlsp-v0_4_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimlsp-v0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimlsp-v0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}