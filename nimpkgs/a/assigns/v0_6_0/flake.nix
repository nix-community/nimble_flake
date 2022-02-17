{
  description = ''syntax sugar for assignments'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-assigns-v0_6_0.flake = false;
  inputs.src-assigns-v0_6_0.type = "github";
  inputs.src-assigns-v0_6_0.owner = "metagn";
  inputs.src-assigns-v0_6_0.repo = "assigns";
  inputs.src-assigns-v0_6_0.ref = "refs/tags/v0.6.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-assigns-v0_6_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-assigns-v0_6_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-assigns-v0_6_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}