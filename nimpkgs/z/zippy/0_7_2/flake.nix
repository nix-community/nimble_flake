{
  description = ''Pure Nim implementation of deflate, zlib, gzip and zip.'';
  inputs.src-zippy-0_7_2.flake = false;
  inputs.src-zippy-0_7_2.type = "github";
  inputs.src-zippy-0_7_2.owner = "guzba";
  inputs.src-zippy-0_7_2.repo = "zippy";
  inputs.src-zippy-0_7_2.ref = "refs/tags/0.7.2";
  
  outputs = { self, nixpkgs, src-zippy-0_7_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zippy-0_7_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-zippy-0_7_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}