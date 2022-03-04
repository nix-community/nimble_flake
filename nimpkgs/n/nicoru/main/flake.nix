{
  description = ''A container runtime written in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nicoru-main.flake = false;
  inputs.src-nicoru-main.type = "github";
  inputs.src-nicoru-main.owner = "fox0430";
  inputs.src-nicoru-main.repo = "nicoru";
  inputs.src-nicoru-main.ref = "refs/heads/main";
  inputs.src-nicoru-main.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."https://github.com/def-/nim-syscall".type = "github";
  inputs."https://github.com/def-/nim-syscall".owner = "riinr";
  inputs."https://github.com/def-/nim-syscall".repo = "flake-nimble";
  inputs."https://github.com/def-/nim-syscall".ref = "flake-pinning";
  inputs."https://github.com/def-/nim-syscall".dir = "nimpkgs/h/https://github.com/def-/nim-syscall";
  inputs."https://github.com/def-/nim-syscall".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/def-/nim-syscall".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nicoru-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nicoru-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nicoru-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}