{
  description = ''A command and library to generate mazes'';
  inputs.src-maze-1_0_0.flake = false;
  inputs.src-maze-1_0_0.type = "github";
  inputs.src-maze-1_0_0.owner = "jiro4989";
  inputs.src-maze-1_0_0.repo = "maze";
  inputs.src-maze-1_0_0.ref = "refs/tags/1.0.0";
  
  outputs = { self, nixpkgs, src-maze-1_0_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-maze-1_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-maze-1_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}