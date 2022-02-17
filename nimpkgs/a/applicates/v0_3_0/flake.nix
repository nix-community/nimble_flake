{
  description = ''"pointers" to cached AST that instantiate routines when called'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-applicates-v0_3_0.flake = false;
  inputs.src-applicates-v0_3_0.type = "github";
  inputs.src-applicates-v0_3_0.owner = "metagn";
  inputs.src-applicates-v0_3_0.repo = "applicates";
  inputs.src-applicates-v0_3_0.ref = "refs/tags/v0.3.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-applicates-v0_3_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-applicates-v0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-applicates-v0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}