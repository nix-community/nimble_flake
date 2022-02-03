{
  description = ''Webp encoder and decoder bindings for Nim'';
  inputs.src-nimwebp-master.flake = false;
  inputs.src-nimwebp-master.type = "github";
  inputs.src-nimwebp-master.owner = "tormund";
  inputs.src-nimwebp-master.repo = "nimwebp";
  inputs.src-nimwebp-master.ref = "refs/heads/master";
  
  
  inputs."nimpng".url = "path:../../../n/nimpng";
  inputs."nimpng".type = "github";
  inputs."nimpng".owner = "riinr";
  inputs."nimpng".repo = "flake-nimble";
  inputs."nimpng".ref = "flake-pinning";
  inputs."nimpng".dir = "nimpkgs/n/nimpng";

  
  inputs."https://github.com/yglukhov/clurp".url = "path:../../../h/https://github.com/yglukhov/clurp";
  inputs."https://github.com/yglukhov/clurp".type = "github";
  inputs."https://github.com/yglukhov/clurp".owner = "riinr";
  inputs."https://github.com/yglukhov/clurp".repo = "flake-nimble";
  inputs."https://github.com/yglukhov/clurp".ref = "flake-pinning";
  inputs."https://github.com/yglukhov/clurp".dir = "nimpkgs/h/https://github.com/yglukhov/clurp";

  outputs = { self, nixpkgs, src-nimwebp-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimwebp-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimwebp-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}