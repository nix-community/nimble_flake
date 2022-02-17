{
  description = ''High level, asynchronous file API mimicking Python's file interface.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-asyncpythonfile-master.flake = false;
  inputs.src-asyncpythonfile-master.type = "github";
  inputs.src-asyncpythonfile-master.owner = "fallingduck";
  inputs.src-asyncpythonfile-master.repo = "asyncpythonfile-nim";
  inputs.src-asyncpythonfile-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-asyncpythonfile-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-asyncpythonfile-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-asyncpythonfile-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}