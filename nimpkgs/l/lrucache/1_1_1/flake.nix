{
  description = ''Least recently used (LRU) cache'';
  inputs.src-lrucache-1_1_1.flake = false;
  inputs.src-lrucache-1_1_1.type = "github";
  inputs.src-lrucache-1_1_1.owner = "jackhftang";
  inputs.src-lrucache-1_1_1.repo = "lrucache";
  inputs.src-lrucache-1_1_1.ref = "refs/tags/1.1.1";
  
  outputs = { self, nixpkgs, src-lrucache-1_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-lrucache-1_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-lrucache-1_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}