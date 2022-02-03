{
  description = ''Serial library for Windows.'';
  inputs.src-winserial-master.flake = false;
  inputs.src-winserial-master.type = "github";
  inputs.src-winserial-master.owner = "bunkford";
  inputs.src-winserial-master.repo = "winserial";
  inputs.src-winserial-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-winserial-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-winserial-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-winserial-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}