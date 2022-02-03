{
  description = ''Nim Game Library'';
  inputs.src-nimgl-1_1_9.flake = false;
  inputs.src-nimgl-1_1_9.type = "github";
  inputs.src-nimgl-1_1_9.owner = "nimgl";
  inputs.src-nimgl-1_1_9.repo = "nimgl";
  inputs.src-nimgl-1_1_9.ref = "refs/tags/1.1.9";
  
  outputs = { self, nixpkgs, src-nimgl-1_1_9, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimgl-1_1_9;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimgl-1_1_9"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}