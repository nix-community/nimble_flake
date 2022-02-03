{
  description = ''Self-contained markdown compiler generating self-contained HTML documents'';
  inputs.src-hastyscribe-v1_0_1.flake = false;
  inputs.src-hastyscribe-v1_0_1.type = "github";
  inputs.src-hastyscribe-v1_0_1.owner = "h3rald";
  inputs.src-hastyscribe-v1_0_1.repo = "hastyscribe";
  inputs.src-hastyscribe-v1_0_1.ref = "refs/tags/v1.0.1";
  
  outputs = { self, nixpkgs, src-hastyscribe-v1_0_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hastyscribe-v1_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-hastyscribe-v1_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}