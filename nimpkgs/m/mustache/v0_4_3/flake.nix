{
  description = ''Mustache in Nim'';
  inputs.src-mustache-v0_4_3.flake = false;
  inputs.src-mustache-v0_4_3.type = "github";
  inputs.src-mustache-v0_4_3.owner = "soasme";
  inputs.src-mustache-v0_4_3.repo = "nim-mustache";
  inputs.src-mustache-v0_4_3.ref = "refs/tags/v0.4.3";
  
  outputs = { self, nixpkgs, src-mustache-v0_4_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mustache-v0_4_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-mustache-v0_4_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}