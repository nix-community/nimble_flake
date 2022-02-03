{
  description = ''Support for ensemble file format and arithmetic using jackknife/bootstrap propagation of errors'';
  inputs.src-ensem-v1_2_1.flake = false;
  inputs.src-ensem-v1_2_1.type = "github";
  inputs.src-ensem-v1_2_1.owner = "JeffersonLab";
  inputs.src-ensem-v1_2_1.repo = "ensem";
  inputs.src-ensem-v1_2_1.ref = "refs/tags/v1.2.1";
  
  outputs = { self, nixpkgs, src-ensem-v1_2_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ensem-v1_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-ensem-v1_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}