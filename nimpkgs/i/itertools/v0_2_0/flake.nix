{
  description = ''Itertools for Nim'';
  inputs.src-itertools-v0_2_0.flake = false;
  inputs.src-itertools-v0_2_0.type = "github";
  inputs.src-itertools-v0_2_0.owner = "narimiran";
  inputs.src-itertools-v0_2_0.repo = "itertools";
  inputs.src-itertools-v0_2_0.ref = "refs/tags/v0.2.0";
  
  outputs = { self, nixpkgs, src-itertools-v0_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-itertools-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-itertools-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}