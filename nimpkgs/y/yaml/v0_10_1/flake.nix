{
  description = ''YAML 1.2 implementation for Nim'';
  inputs.src-yaml-v0_10_1.flake = false;
  inputs.src-yaml-v0_10_1.type = "github";
  inputs.src-yaml-v0_10_1.owner = "flyx";
  inputs.src-yaml-v0_10_1.repo = "NimYAML";
  inputs.src-yaml-v0_10_1.ref = "refs/tags/v0.10.1";
  
  outputs = { self, nixpkgs, src-yaml-v0_10_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-yaml-v0_10_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-yaml-v0_10_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}