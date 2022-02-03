{
  description = ''A Nim implementation of Simon Cooke's Bip Buffer. A type of circular buffer ensuring contiguous blocks of memory'';
  inputs.src-bipbuffer-master.flake = false;
  inputs.src-bipbuffer-master.type = "github";
  inputs.src-bipbuffer-master.owner = "MarcAzar";
  inputs.src-bipbuffer-master.repo = "BipBuffer";
  inputs.src-bipbuffer-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-BipBuffer-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-BipBuffer-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-BipBuffer-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}