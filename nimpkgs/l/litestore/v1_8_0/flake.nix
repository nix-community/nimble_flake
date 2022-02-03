{
  description = ''A lightweight, self-contained, RESTful, searchable, multi-format NoSQL document store'';
  inputs.src-litestore-v1_8_0.flake = false;
  inputs.src-litestore-v1_8_0.type = "github";
  inputs.src-litestore-v1_8_0.owner = "h3rald";
  inputs.src-litestore-v1_8_0.repo = "litestore";
  inputs.src-litestore-v1_8_0.ref = "refs/tags/v1.8.0";
  
  outputs = { self, nixpkgs, src-litestore-v1_8_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-litestore-v1_8_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-litestore-v1_8_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}