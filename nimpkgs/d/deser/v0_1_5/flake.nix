{
  description = ''De/serialization library for Nim '';
  inputs.src-deser-v0_1_5.flake = false;
  inputs.src-deser-v0_1_5.type = "github";
  inputs.src-deser-v0_1_5.owner = "gabbhack";
  inputs.src-deser-v0_1_5.repo = "deser";
  inputs.src-deser-v0_1_5.ref = "refs/tags/v0.1.5";
  
  outputs = { self, nixpkgs, src-deser-v0_1_5, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-deser-v0_1_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-deser-v0_1_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}