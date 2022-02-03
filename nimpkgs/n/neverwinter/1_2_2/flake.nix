{
  description = ''Neverwinter Nights 1 data accessor library'';
  inputs.src-neverwinter-1_2_2.flake = false;
  inputs.src-neverwinter-1_2_2.type = "github";
  inputs.src-neverwinter-1_2_2.owner = "niv";
  inputs.src-neverwinter-1_2_2.repo = "neverwinter.nim";
  inputs.src-neverwinter-1_2_2.ref = "refs/tags/1.2.2";
  
  outputs = { self, nixpkgs, src-neverwinter-1_2_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-neverwinter-1_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-neverwinter-1_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}