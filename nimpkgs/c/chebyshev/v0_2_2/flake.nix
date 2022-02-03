{
  description = ''Chebyshev approximation.'';
  inputs.src-chebyshev-v0_2_2.flake = false;
  inputs.src-chebyshev-v0_2_2.type = "github";
  inputs.src-chebyshev-v0_2_2.owner = "jxy";
  inputs.src-chebyshev-v0_2_2.repo = "chebyshev";
  inputs.src-chebyshev-v0_2_2.ref = "refs/tags/v0.2.2";
  
  outputs = { self, nixpkgs, src-chebyshev-v0_2_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-chebyshev-v0_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-chebyshev-v0_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}