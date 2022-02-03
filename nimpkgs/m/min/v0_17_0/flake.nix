{
  description = ''A small but practical concatenative programming language and shell.'';
  inputs.src-min-v0_17_0.flake = false;
  inputs.src-min-v0_17_0.type = "github";
  inputs.src-min-v0_17_0.owner = "h3rald";
  inputs.src-min-v0_17_0.repo = "min";
  inputs.src-min-v0_17_0.ref = "refs/tags/v0.17.0";
  
  outputs = { self, nixpkgs, src-min-v0_17_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-min-v0_17_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-min-v0_17_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}