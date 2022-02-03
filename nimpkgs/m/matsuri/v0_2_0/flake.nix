{
  description = ''Useful Variant Type and Powerful Pattern Matching for Nim'';
  inputs.src-matsuri-v0_2_0.flake = false;
  inputs.src-matsuri-v0_2_0.type = "github";
  inputs.src-matsuri-v0_2_0.owner = "zer0-star";
  inputs.src-matsuri-v0_2_0.repo = "matsuri";
  inputs.src-matsuri-v0_2_0.ref = "refs/tags/v0.2.0";
  
  outputs = { self, nixpkgs, src-matsuri-v0_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-matsuri-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-matsuri-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}