{
  description = ''A Nim mini DSL to execute shell commands'';
  inputs.src-shell-v0_1_0.flake = false;
  inputs.src-shell-v0_1_0.type = "github";
  inputs.src-shell-v0_1_0.owner = "Vindaar";
  inputs.src-shell-v0_1_0.repo = "shell";
  inputs.src-shell-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, src-shell-v0_1_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shell-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-shell-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}