{
  description = ''Pure library for matching file paths against Unix style glob patterns.'';
  inputs.src-glob-master.flake = false;
  inputs.src-glob-master.type = "github";
  inputs.src-glob-master.owner = "citycide";
  inputs.src-glob-master.repo = "glob";
  inputs.src-glob-master.ref = "refs/heads/master";
  
  
  inputs."regex".url = "path:../../../r/regex";
  inputs."regex".type = "github";
  inputs."regex".owner = "riinr";
  inputs."regex".repo = "flake-nimble";
  inputs."regex".ref = "flake-pinning";
  inputs."regex".dir = "nimpkgs/r/regex";

  outputs = { self, nixpkgs, src-glob-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-glob-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-glob-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}