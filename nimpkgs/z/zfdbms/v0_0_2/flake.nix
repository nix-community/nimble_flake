{
  description = ''Simple database generator, connector and query tools.'';
  inputs.src-zfdbms-v0_0_2.flake = false;
  inputs.src-zfdbms-v0_0_2.type = "github";
  inputs.src-zfdbms-v0_0_2.owner = "zendbit";
  inputs.src-zfdbms-v0_0_2.repo = "nim.zfdbms";
  inputs.src-zfdbms-v0_0_2.ref = "refs/tags/v0.0.2";
  
  
  inputs."stdext".url = "path:../../../s/stdext";
  inputs."stdext".type = "github";
  inputs."stdext".owner = "riinr";
  inputs."stdext".repo = "flake-nimble";
  inputs."stdext".ref = "flake-pinning";
  inputs."stdext".dir = "nimpkgs/s/stdext";

  outputs = { self, nixpkgs, src-zfdbms-v0_0_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zfdbms-v0_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-zfdbms-v0_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}