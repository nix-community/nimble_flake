{
  description = ''Web Technologies based Crossplatform GUI Framework'';
  inputs.src-crowngui-v0_2_3.flake = false;
  inputs.src-crowngui-v0_2_3.type = "github";
  inputs.src-crowngui-v0_2_3.owner = "bung87";
  inputs.src-crowngui-v0_2_3.repo = "crowngui";
  inputs.src-crowngui-v0_2_3.ref = "refs/tags/v0.2.3";
  
  
  inputs."nimble".url = "path:../../../n/nimble";
  inputs."nimble".type = "github";
  inputs."nimble".owner = "riinr";
  inputs."nimble".repo = "flake-nimble";
  inputs."nimble".ref = "flake-pinning";
  inputs."nimble".dir = "nimpkgs/n/nimble";

  
  inputs."plists".url = "path:../../../p/plists";
  inputs."plists".type = "github";
  inputs."plists".owner = "riinr";
  inputs."plists".repo = "flake-nimble";
  inputs."plists".ref = "flake-pinning";
  inputs."plists".dir = "nimpkgs/p/plists";

  
  inputs."cligen".url = "path:../../../c/cligen";
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";

  
  inputs."imageman".url = "path:../../../i/imageman";
  inputs."imageman".type = "github";
  inputs."imageman".owner = "riinr";
  inputs."imageman".repo = "flake-nimble";
  inputs."imageman".ref = "flake-pinning";
  inputs."imageman".dir = "nimpkgs/i/imageman";

  
  inputs."zopflipng".url = "path:../../../z/zopflipng";
  inputs."zopflipng".type = "github";
  inputs."zopflipng".owner = "riinr";
  inputs."zopflipng".repo = "flake-nimble";
  inputs."zopflipng".ref = "flake-pinning";
  inputs."zopflipng".dir = "nimpkgs/z/zopflipng";

  
  inputs."rcedit".url = "path:../../../r/rcedit";
  inputs."rcedit".type = "github";
  inputs."rcedit".owner = "riinr";
  inputs."rcedit".repo = "flake-nimble";
  inputs."rcedit".ref = "flake-pinning";
  inputs."rcedit".dir = "nimpkgs/r/rcedit";

  
  inputs."https://github.com/bung87/static_server".url = "path:../../../h/https://github.com/bung87/static_server";
  inputs."https://github.com/bung87/static_server".type = "github";
  inputs."https://github.com/bung87/static_server".owner = "riinr";
  inputs."https://github.com/bung87/static_server".repo = "flake-nimble";
  inputs."https://github.com/bung87/static_server".ref = "flake-pinning";
  inputs."https://github.com/bung87/static_server".dir = "nimpkgs/h/https://github.com/bung87/static_server";

  
  inputs."https://github.com/bung87/icon".url = "path:../../../h/https://github.com/bung87/icon";
  inputs."https://github.com/bung87/icon".type = "github";
  inputs."https://github.com/bung87/icon".owner = "riinr";
  inputs."https://github.com/bung87/icon".repo = "flake-nimble";
  inputs."https://github.com/bung87/icon".ref = "flake-pinning";
  inputs."https://github.com/bung87/icon".dir = "nimpkgs/h/https://github.com/bung87/icon";

  
  inputs."jsonschema".url = "path:../../../j/jsonschema";
  inputs."jsonschema".type = "github";
  inputs."jsonschema".owner = "riinr";
  inputs."jsonschema".repo = "flake-nimble";
  inputs."jsonschema".ref = "flake-pinning";
  inputs."jsonschema".dir = "nimpkgs/j/jsonschema";

  outputs = { self, nixpkgs, src-crowngui-v0_2_3, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-crowngui-v0_2_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-crowngui-v0_2_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}