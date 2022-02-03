{
  description = ''A high-level GLFW 3 wrapper'';
  inputs.src-glfw-v3_3_4_0.flake = false;
  inputs.src-glfw-v3_3_4_0.type = "github";
  inputs.src-glfw-v3_3_4_0.owner = "johnnovak";
  inputs.src-glfw-v3_3_4_0.repo = "nim-glfw";
  inputs.src-glfw-v3_3_4_0.ref = "refs/tags/v3.3.4.0";
  
  outputs = { self, nixpkgs, src-glfw-v3_3_4_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-glfw-v3_3_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-glfw-v3_3_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}