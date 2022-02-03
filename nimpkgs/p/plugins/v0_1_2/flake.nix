{
  description = ''Plugin system for Nim'';
  inputs.src-plugins-v0_1_2.flake = false;
  inputs.src-plugins-v0_1_2.type = "github";
  inputs.src-plugins-v0_1_2.owner = "genotrance";
  inputs.src-plugins-v0_1_2.repo = "plugins";
  inputs.src-plugins-v0_1_2.ref = "refs/tags/v0.1.2";
  
  outputs = { self, nixpkgs, src-plugins-v0_1_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-plugins-v0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-plugins-v0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}