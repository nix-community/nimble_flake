{
  description = ''A lightweight, self-contained, RESTful, searchable, multi-format NoSQL document store'';
  inputs.src-litestore-v1_0_4.flake = false;
  inputs.src-litestore-v1_0_4.type = "github";
  inputs.src-litestore-v1_0_4.owner = "h3rald";
  inputs.src-litestore-v1_0_4.repo = "litestore";
  inputs.src-litestore-v1_0_4.ref = "refs/tags/v1.0.4";
  
  
  inputs."nimrod".url = "path:../../../n/nimrod";
  inputs."nimrod".type = "github";
  inputs."nimrod".owner = "riinr";
  inputs."nimrod".repo = "flake-nimble";
  inputs."nimrod".ref = "flake-pinning";
  inputs."nimrod".dir = "nimpkgs/n/nimrod";

  outputs = { self, nixpkgs, src-litestore-v1_0_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-litestore-v1_0_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-litestore-v1_0_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}