{
  description = ''Nim wrapper for miniz'';
  inputs.src-nim_miniz-v1_0_0.flake = false;
  inputs.src-nim_miniz-v1_0_0.type = "github";
  inputs.src-nim_miniz-v1_0_0.owner = "h3rald";
  inputs.src-nim_miniz-v1_0_0.repo = "nim-miniz";
  inputs.src-nim_miniz-v1_0_0.ref = "refs/tags/v1.0.0";
  
  outputs = { self, nixpkgs, src-nim_miniz-v1_0_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nim_miniz-v1_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nim_miniz-v1_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}