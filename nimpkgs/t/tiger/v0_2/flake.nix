{
  description = ''Tiger hash function'';
  inputs.src-tiger-v0_2.flake = false;
  inputs.src-tiger-v0_2.type = "other";
  inputs.src-tiger-v0_2.owner = "~ehmry";
  inputs.src-tiger-v0_2.repo = "nim_tiger";
  inputs.src-tiger-v0_2.ref = "refs/tags/v0.2";
  
  outputs = { self, nixpkgs, src-tiger-v0_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-tiger-v0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-tiger-v0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}