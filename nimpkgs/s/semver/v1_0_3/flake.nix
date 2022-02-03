{
  description = ''Semantic versioning parser for Nim. Allows the parsing of version strings into objects and the comparing of version objects.'';
  inputs.src-semver-v1_0_3.flake = false;
  inputs.src-semver-v1_0_3.type = "github";
  inputs.src-semver-v1_0_3.owner = "euantorano";
  inputs.src-semver-v1_0_3.repo = "semver.nim";
  inputs.src-semver-v1_0_3.ref = "refs/tags/v1.0.3";
  
  outputs = { self, nixpkgs, src-semver-v1_0_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-semver-v1_0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-semver-v1_0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}