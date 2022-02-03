{
  description = ''Nim's Windows API and COM Library'';
  inputs.src-winim-3_7_2.flake = false;
  inputs.src-winim-3_7_2.type = "github";
  inputs.src-winim-3_7_2.owner = "khchen";
  inputs.src-winim-3_7_2.repo = "winim";
  inputs.src-winim-3_7_2.ref = "refs/tags/3.7.2";
  
  outputs = { self, nixpkgs, src-winim-3_7_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-winim-3_7_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-winim-3_7_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}