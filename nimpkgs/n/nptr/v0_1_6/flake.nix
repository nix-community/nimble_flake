{
  description = ''Nim lang smart pointers'';
  inputs.src-nptr-v0_1_6.flake = false;
  inputs.src-nptr-v0_1_6.type = "github";
  inputs.src-nptr-v0_1_6.owner = "henryas";
  inputs.src-nptr-v0_1_6.repo = "nptr";
  inputs.src-nptr-v0_1_6.ref = "refs/tags/v0.1.6";
  
  outputs = { self, nixpkgs, src-nptr-v0_1_6, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nptr-v0_1_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nptr-v0_1_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}