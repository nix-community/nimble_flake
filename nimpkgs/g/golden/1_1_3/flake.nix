{
  description = ''a benchmark tool'';
  inputs.src-golden-1_1_3.flake = false;
  inputs.src-golden-1_1_3.type = "github";
  inputs.src-golden-1_1_3.owner = "disruptek";
  inputs.src-golden-1_1_3.repo = "golden";
  inputs.src-golden-1_1_3.ref = "refs/tags/1.1.3";
  
  
  inputs."cligen".url = "path:../../../c/cligen";
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";

  
  inputs."foreach".url = "path:../../../f/foreach";
  inputs."foreach".type = "github";
  inputs."foreach".owner = "riinr";
  inputs."foreach".repo = "flake-nimble";
  inputs."foreach".ref = "flake-pinning";
  inputs."foreach".dir = "nimpkgs/f/foreach";

  
  inputs."http://github.com/genotrance/nimgit2.git".url = "path:../../../h/http://github.com/genotrance/nimgit2.git";
  inputs."http://github.com/genotrance/nimgit2.git".type = "github";
  inputs."http://github.com/genotrance/nimgit2.git".owner = "riinr";
  inputs."http://github.com/genotrance/nimgit2.git".repo = "flake-nimble";
  inputs."http://github.com/genotrance/nimgit2.git".ref = "flake-pinning";
  inputs."http://github.com/genotrance/nimgit2.git".dir = "nimpkgs/h/http://github.com/genotrance/nimgit2.git";

  outputs = { self, nixpkgs, src-golden-1_1_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-golden-1_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-golden-1_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}