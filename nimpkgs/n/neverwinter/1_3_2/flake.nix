{
  description = ''Neverwinter Nights 1 data accessor library'';
  inputs.src-neverwinter-1_3_2.flake = false;
  inputs.src-neverwinter-1_3_2.type = "github";
  inputs.src-neverwinter-1_3_2.owner = "niv";
  inputs.src-neverwinter-1_3_2.repo = "neverwinter.nim";
  inputs.src-neverwinter-1_3_2.ref = "refs/tags/1.3.2";
  
  outputs = { self, nixpkgs, src-neverwinter-1_3_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-neverwinter-1_3_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-neverwinter-1_3_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}