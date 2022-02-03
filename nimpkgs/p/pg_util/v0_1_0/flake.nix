{
  description = ''Postgres utility functions'';
  inputs.src-pg_util-v0_1_0.flake = false;
  inputs.src-pg_util-v0_1_0.type = "github";
  inputs.src-pg_util-v0_1_0.owner = "hiteshjasani";
  inputs.src-pg_util-v0_1_0.repo = "nim-pg-util";
  inputs.src-pg_util-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, src-pg_util-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pg_util-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-pg_util-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}