{
  description = ''A safe, high-level, optimized OpenGL wrapper'';
  inputs.src-aglet-0_3_1.flake = false;
  inputs.src-aglet-0_3_1.type = "github";
  inputs.src-aglet-0_3_1.owner = "liquid600pgm";
  inputs.src-aglet-0_3_1.repo = "aglet";
  inputs.src-aglet-0_3_1.ref = "refs/tags/0.3.1";
  
  
  inputs."glm".url = "path:../../../g/glm";
  inputs."glm".type = "github";
  inputs."glm".owner = "riinr";
  inputs."glm".repo = "flake-nimble";
  inputs."glm".ref = "flake-pinning";
  inputs."glm".dir = "nimpkgs/g/glm";

  
  inputs."https://github.com/nimgl/glfw".url = "path:../../../h/https://github.com/nimgl/glfw";
  inputs."https://github.com/nimgl/glfw".type = "github";
  inputs."https://github.com/nimgl/glfw".owner = "riinr";
  inputs."https://github.com/nimgl/glfw".repo = "flake-nimble";
  inputs."https://github.com/nimgl/glfw".ref = "flake-pinning";
  inputs."https://github.com/nimgl/glfw".dir = "nimpkgs/h/https://github.com/nimgl/glfw";

  outputs = { self, nixpkgs, src-aglet-0_3_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-aglet-0_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-aglet-0_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}