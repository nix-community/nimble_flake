{
  description = ''Static GLFW for nim'';
  inputs.src-staticglfw-v3_3_0_0.flake = false;
  inputs.src-staticglfw-v3_3_0_0.type = "github";
  inputs.src-staticglfw-v3_3_0_0.owner = "treeform";
  inputs.src-staticglfw-v3_3_0_0.repo = "staticglfw";
  inputs.src-staticglfw-v3_3_0_0.ref = "refs/tags/v3.3.0.0";
  
  outputs = { self, nixpkgs, src-staticglfw-v3_3_0_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-staticglfw-v3_3_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-staticglfw-v3_3_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}