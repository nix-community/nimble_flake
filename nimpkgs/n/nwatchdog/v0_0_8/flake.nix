{
  description = ''Simple watchdog (watch file changes modified, deleted, created) in nim lang.'';
  inputs.src-nwatchdog-v0_0_8.flake = false;
  inputs.src-nwatchdog-v0_0_8.type = "github";
  inputs.src-nwatchdog-v0_0_8.owner = "zendbit";
  inputs.src-nwatchdog-v0_0_8.repo = "nim.nwatchdog";
  inputs.src-nwatchdog-v0_0_8.ref = "refs/tags/v0.0.8";
  
  outputs = { self, nixpkgs, src-nwatchdog-v0_0_8, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nwatchdog-v0_0_8;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nwatchdog-v0_0_8"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}