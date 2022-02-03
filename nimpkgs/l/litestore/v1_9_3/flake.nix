{
  description = ''A lightweight, self-contained, RESTful, searchable, multi-format NoSQL document store'';
  inputs.src-litestore-v1_9_3.flake = false;
  inputs.src-litestore-v1_9_3.type = "github";
  inputs.src-litestore-v1_9_3.owner = "h3rald";
  inputs.src-litestore-v1_9_3.repo = "litestore";
  inputs.src-litestore-v1_9_3.ref = "refs/tags/v1.9.3";
  
  outputs = { self, nixpkgs, src-litestore-v1_9_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-litestore-v1_9_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-litestore-v1_9_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}