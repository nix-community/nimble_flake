{
  description = ''A Nim mini DSL to execute shell commands'';
  inputs.src-shell-v0_4_3.flake = false;
  inputs.src-shell-v0_4_3.type = "github";
  inputs.src-shell-v0_4_3.owner = "Vindaar";
  inputs.src-shell-v0_4_3.repo = "shell";
  inputs.src-shell-v0_4_3.ref = "refs/tags/v0.4.3";
  
  outputs = { self, nixpkgs, src-shell-v0_4_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shell-v0_4_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-shell-v0_4_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}