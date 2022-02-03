{
  description = ''Serializer and tools for flat binary files.'';
  inputs.src-flatty-0_1_3.flake = false;
  inputs.src-flatty-0_1_3.type = "github";
  inputs.src-flatty-0_1_3.owner = "treeform";
  inputs.src-flatty-0_1_3.repo = "flatty";
  inputs.src-flatty-0_1_3.ref = "refs/tags/0.1.3";
  
  outputs = { self, nixpkgs, src-flatty-0_1_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-flatty-0_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-flatty-0_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}