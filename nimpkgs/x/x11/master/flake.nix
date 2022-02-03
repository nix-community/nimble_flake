{
  description = ''Wrapper for X11'';
  inputs.src-x11-master.flake = false;
  inputs.src-x11-master.type = "github";
  inputs.src-x11-master.owner = "nim-lang";
  inputs.src-x11-master.repo = "x11";
  inputs.src-x11-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-x11-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-x11-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-x11-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}