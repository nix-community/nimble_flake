{
  description = ''zfcore is high performance asynchttpserver and web framework for nim lang'';
  inputs.src-zfcore-v1_0_6-stable.flake = false;
  inputs.src-zfcore-v1_0_6-stable.type = "github";
  inputs.src-zfcore-v1_0_6-stable.owner = "zendbit";
  inputs.src-zfcore-v1_0_6-stable.repo = "nim.zfcore";
  inputs.src-zfcore-v1_0_6-stable.ref = "refs/tags/v1.0.6-stable";
  
  
  inputs."zfblast".url = "path:../../../z/zfblast";
  inputs."zfblast".type = "github";
  inputs."zfblast".owner = "riinr";
  inputs."zfblast".repo = "flake-nimble";
  inputs."zfblast".ref = "flake-pinning";
  inputs."zfblast".dir = "nimpkgs/z/zfblast";

  
  inputs."uri3".url = "path:../../../u/uri3";
  inputs."uri3".type = "github";
  inputs."uri3".owner = "riinr";
  inputs."uri3".repo = "flake-nimble";
  inputs."uri3".ref = "flake-pinning";
  inputs."uri3".dir = "nimpkgs/u/uri3";

  outputs = { self, nixpkgs, src-zfcore-v1_0_6-stable, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zfcore-v1_0_6-stable;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-zfcore-v1_0_6-stable"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}