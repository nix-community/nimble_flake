{
  description = ''Arduino bindings for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-arduino-main.flake = false;
  inputs.src-arduino-main.type = "github";
  inputs.src-arduino-main.owner = "markspanbroek";
  inputs.src-arduino-main.repo = "nim-arduino";
  inputs.src-arduino-main.ref = "refs/heads/main";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-arduino-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-arduino-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-arduino-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}