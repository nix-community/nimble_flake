{
  description = ''Nimterop makes C/C++ interop within Nim seamless'';
  inputs.src-nimterop-v0_5_5.flake = false;
  inputs.src-nimterop-v0_5_5.type = "github";
  inputs.src-nimterop-v0_5_5.owner = "genotrance";
  inputs.src-nimterop-v0_5_5.repo = "nimterop";
  inputs.src-nimterop-v0_5_5.ref = "refs/tags/v0.5.5";
  
  outputs = { self, nixpkgs, src-nimterop-v0_5_5, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimterop-v0_5_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimterop-v0_5_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}