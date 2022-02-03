{
  description = ''A parser for Jupyter notebooks.'';
  inputs.src-holst-0_1_3.flake = false;
  inputs.src-holst-0_1_3.type = "github";
  inputs.src-holst-0_1_3.owner = "ruivieira";
  inputs.src-holst-0_1_3.repo = "nim-holst";
  inputs.src-holst-0_1_3.ref = "refs/tags/0.1.3";
  
  outputs = { self, nixpkgs, src-holst-0_1_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-holst-0_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-holst-0_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}