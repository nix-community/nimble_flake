{
  description = ''Bindings for Simple and Fast Multimedia Library (through CSFML)'';
  inputs.src-csfml-v2_3_0.flake = false;
  inputs.src-csfml-v2_3_0.type = "github";
  inputs.src-csfml-v2_3_0.owner = "oprypin";
  inputs.src-csfml-v2_3_0.repo = "nim-csfml";
  inputs.src-csfml-v2_3_0.ref = "refs/tags/v2.3.0";
  
  outputs = { self, nixpkgs, src-csfml-v2_3_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-csfml-v2_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-csfml-v2_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}