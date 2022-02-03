{
  description = ''Redux Implementation in nim'';
  inputs.src-redux_nim-v1_0_3.flake = false;
  inputs.src-redux_nim-v1_0_3.type = "github";
  inputs.src-redux_nim-v1_0_3.owner = "M4RC3L05";
  inputs.src-redux_nim-v1_0_3.repo = "redux-nim";
  inputs.src-redux_nim-v1_0_3.ref = "refs/tags/v1.0.3";
  
  outputs = { self, nixpkgs, src-redux_nim-v1_0_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-redux_nim-v1_0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-redux_nim-v1_0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}