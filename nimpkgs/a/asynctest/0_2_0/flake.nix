{
  description = ''Test asynchronous code'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-asynctest-0_2_0.flake = false;
  inputs.src-asynctest-0_2_0.type = "github";
  inputs.src-asynctest-0_2_0.owner = "markspanbroek";
  inputs.src-asynctest-0_2_0.repo = "asynctest";
  inputs.src-asynctest-0_2_0.ref = "refs/tags/0.2.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-asynctest-0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-asynctest-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-asynctest-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}