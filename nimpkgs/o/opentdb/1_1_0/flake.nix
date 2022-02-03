{
  description = ''Wrapper around the open trivia db api'';
  inputs.src-opentdb-1_1_0.flake = false;
  inputs.src-opentdb-1_1_0.type = "github";
  inputs.src-opentdb-1_1_0.owner = "ire4ever1190";
  inputs.src-opentdb-1_1_0.repo = "nim-opentmdb";
  inputs.src-opentdb-1_1_0.ref = "refs/tags/1.1.0";
  
  outputs = { self, nixpkgs, src-opentdb-1_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-opentdb-1_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-opentdb-1_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}