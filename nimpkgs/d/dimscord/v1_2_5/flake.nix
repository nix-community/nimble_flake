{
  description = ''A Discord Bot & REST Library.'';
  inputs.src-dimscord-v1_2_5.flake = false;
  inputs.src-dimscord-v1_2_5.type = "github";
  inputs.src-dimscord-v1_2_5.owner = "krisppurg";
  inputs.src-dimscord-v1_2_5.repo = "dimscord";
  inputs.src-dimscord-v1_2_5.ref = "refs/tags/v1.2.5";
  
  
  inputs."zippy".url = "path:../../../z/zippy";
  inputs."zippy".type = "github";
  inputs."zippy".owner = "riinr";
  inputs."zippy".repo = "flake-nimble";
  inputs."zippy".ref = "flake-pinning";
  inputs."zippy".dir = "nimpkgs/z/zippy";

  
  inputs."ws".url = "path:../../../w/ws";
  inputs."ws".type = "github";
  inputs."ws".owner = "riinr";
  inputs."ws".repo = "flake-nimble";
  inputs."ws".ref = "flake-pinning";
  inputs."ws".dir = "nimpkgs/w/ws";

  
  inputs."regex".url = "path:../../../r/regex";
  inputs."regex".type = "github";
  inputs."regex".owner = "riinr";
  inputs."regex".repo = "flake-nimble";
  inputs."regex".ref = "flake-pinning";
  inputs."regex".dir = "nimpkgs/r/regex";

  
  inputs."libsodium".url = "path:../../../l/libsodium";
  inputs."libsodium".type = "github";
  inputs."libsodium".owner = "riinr";
  inputs."libsodium".repo = "flake-nimble";
  inputs."libsodium".ref = "flake-pinning";
  inputs."libsodium".dir = "nimpkgs/l/libsodium";

  
  inputs."flatty".url = "path:../../../f/flatty";
  inputs."flatty".type = "github";
  inputs."flatty".owner = "riinr";
  inputs."flatty".repo = "flake-nimble";
  inputs."flatty".ref = "flake-pinning";
  inputs."flatty".dir = "nimpkgs/f/flatty";

  outputs = { self, nixpkgs, src-dimscord-v1_2_5, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-dimscord-v1_2_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-dimscord-v1_2_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}