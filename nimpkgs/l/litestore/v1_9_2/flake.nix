{
  description = ''A lightweight, self-contained, RESTful, searchable, multi-format NoSQL document store'';
  inputs.src-litestore-v1_9_2.flake = false;
  inputs.src-litestore-v1_9_2.type = "github";
  inputs.src-litestore-v1_9_2.owner = "h3rald";
  inputs.src-litestore-v1_9_2.repo = "litestore";
  inputs.src-litestore-v1_9_2.ref = "refs/tags/v1.9.2";
  
  outputs = { self, nixpkgs, src-litestore-v1_9_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-litestore-v1_9_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-litestore-v1_9_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}