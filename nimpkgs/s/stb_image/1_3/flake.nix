{
  description = ''A wrapper for stb_image and stb_image_write.'';
  inputs.src-stb_image-1_3.flake = false;
  inputs.src-stb_image-1_3.type = "gitlab";
  inputs.src-stb_image-1_3.owner = "define-private-public";
  inputs.src-stb_image-1_3.repo = "stb_image-Nim";
  inputs.src-stb_image-1_3.ref = "refs/tags/1.3";
  
  outputs = { self, nixpkgs, src-stb_image-1_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stb_image-1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-stb_image-1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}