{
  description = ''Red/Black Trees'';
  inputs.src-rbtree-0_3_0.flake = false;
  inputs.src-rbtree-0_3_0.type = "github";
  inputs.src-rbtree-0_3_0.owner = "Nycto";
  inputs.src-rbtree-0_3_0.repo = "RBTreeNim";
  inputs.src-rbtree-0_3_0.ref = "refs/tags/0.3.0";
  
  outputs = { self, nixpkgs, src-rbtree-0_3_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rbtree-0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-rbtree-0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}