{
  description = ''Small library for working with vectors'';
  inputs.src-prettyvec-main.flake = false;
  inputs.src-prettyvec-main.type = "github";
  inputs.src-prettyvec-main.owner = "prettybauble";
  inputs.src-prettyvec-main.repo = "prettyvec";
  inputs.src-prettyvec-main.ref = "refs/heads/main";
  
  outputs = { self, nixpkgs, src-prettyvec-main, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-prettyvec-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-prettyvec-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}