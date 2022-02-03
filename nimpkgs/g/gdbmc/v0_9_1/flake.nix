{
  description = ''This library is a wrapper to C GDBM library'';
  inputs.src-gdbmc-v0_9_1.flake = false;
  inputs.src-gdbmc-v0_9_1.type = "github";
  inputs.src-gdbmc-v0_9_1.owner = "vycb";
  inputs.src-gdbmc-v0_9_1.repo = "gdbmc.nim";
  inputs.src-gdbmc-v0_9_1.ref = "refs/tags/v0.9.1";
  
  outputs = { self, nixpkgs, src-gdbmc-v0_9_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gdbmc-v0_9_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-gdbmc-v0_9_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}