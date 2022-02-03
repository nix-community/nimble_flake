{
  description = ''create db util sources from csv'';
  inputs.src-csv2dbsrc-v0_2_1.flake = false;
  inputs.src-csv2dbsrc-v0_2_1.type = "github";
  inputs.src-csv2dbsrc-v0_2_1.owner = "z-kk";
  inputs.src-csv2dbsrc-v0_2_1.repo = "csv2dbsrc";
  inputs.src-csv2dbsrc-v0_2_1.ref = "refs/tags/v0.2.1";
  
  outputs = { self, nixpkgs, src-csv2dbsrc-v0_2_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-csv2dbsrc-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-csv2dbsrc-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}