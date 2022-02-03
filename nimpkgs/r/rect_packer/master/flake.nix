{
  description = ''Pack rects into bigger rect'';
  inputs.src-rect_packer-master.flake = false;
  inputs.src-rect_packer-master.type = "github";
  inputs.src-rect_packer-master.owner = "yglukhov";
  inputs.src-rect_packer-master.repo = "rect_packer";
  inputs.src-rect_packer-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-rect_packer-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rect_packer-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-rect_packer-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}