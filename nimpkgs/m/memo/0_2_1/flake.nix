{
  description = ''Memoize Nim functions'';
  inputs.src-memo-0_2_1.flake = false;
  inputs.src-memo-0_2_1.type = "github";
  inputs.src-memo-0_2_1.owner = "andreaferretti";
  inputs.src-memo-0_2_1.repo = "memo";
  inputs.src-memo-0_2_1.ref = "refs/tags/0.2.1";
  
  outputs = { self, nixpkgs, src-memo-0_2_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-memo-0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-memo-0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}