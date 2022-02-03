{
  description = ''High performance http server (https://tools.ietf.org/html/rfc2616) with persistent connection for nim language.'';
  inputs.src-zfblast-v0_1_5.flake = false;
  inputs.src-zfblast-v0_1_5.type = "github";
  inputs.src-zfblast-v0_1_5.owner = "zendbit";
  inputs.src-zfblast-v0_1_5.repo = "nim.zfblast";
  inputs.src-zfblast-v0_1_5.ref = "refs/tags/v0.1.5";
  
  
  inputs."uri3".url = "path:../../../u/uri3";
  inputs."uri3".type = "github";
  inputs."uri3".owner = "riinr";
  inputs."uri3".repo = "flake-nimble";
  inputs."uri3".ref = "flake-pinning";
  inputs."uri3".dir = "nimpkgs/u/uri3";

  outputs = { self, nixpkgs, src-zfblast-v0_1_5, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zfblast-v0_1_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-zfblast-v0_1_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}