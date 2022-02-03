{
  description = ''Convert json node to camelcase'';
  inputs.src-camelize-v0_2_1.flake = false;
  inputs.src-camelize-v0_2_1.type = "github";
  inputs.src-camelize-v0_2_1.owner = "kixixixixi";
  inputs.src-camelize-v0_2_1.repo = "camelize";
  inputs.src-camelize-v0_2_1.ref = "refs/tags/v0.2.1";
  
  outputs = { self, nixpkgs, src-camelize-v0_2_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-camelize-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-camelize-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}