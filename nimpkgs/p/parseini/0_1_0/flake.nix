{
  description = ''A high-performance ini parse library for nim.'';
  inputs.src-parseini-0_1_0.flake = false;
  inputs.src-parseini-0_1_0.type = "github";
  inputs.src-parseini-0_1_0.owner = "lihf8515";
  inputs.src-parseini-0_1_0.repo = "parseini";
  inputs.src-parseini-0_1_0.ref = "refs/tags/0.1.0";
  
  outputs = { self, nixpkgs, src-parseini-0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-parseini-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-parseini-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}