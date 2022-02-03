{
  description = ''Erlang/Elixir NIFs for nim'';
  inputs.src-nimler-v4_1.flake = false;
  inputs.src-nimler-v4_1.type = "github";
  inputs.src-nimler-v4_1.owner = "wltsmrz";
  inputs.src-nimler-v4_1.repo = "nimler";
  inputs.src-nimler-v4_1.ref = "refs/tags/v4.1";
  
  outputs = { self, nixpkgs, src-nimler-v4_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimler-v4_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimler-v4_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}