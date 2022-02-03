{
  description = ''Desktop notifications'';
  inputs.src-notification-v0_1_1.flake = false;
  inputs.src-notification-v0_1_1.type = "github";
  inputs.src-notification-v0_1_1.owner = "SolitudeSF";
  inputs.src-notification-v0_1_1.repo = "notification";
  inputs.src-notification-v0_1_1.ref = "refs/tags/v0.1.1";
  
  
  inputs."dbus".url = "path:../../../d/dbus";
  inputs."dbus".type = "github";
  inputs."dbus".owner = "riinr";
  inputs."dbus".repo = "flake-nimble";
  inputs."dbus".ref = "flake-pinning";
  inputs."dbus".dir = "nimpkgs/d/dbus";

  
  inputs."imageman".url = "path:../../../i/imageman";
  inputs."imageman".type = "github";
  inputs."imageman".owner = "riinr";
  inputs."imageman".repo = "flake-nimble";
  inputs."imageman".ref = "flake-pinning";
  inputs."imageman".dir = "nimpkgs/i/imageman";

  outputs = { self, nixpkgs, src-notification-v0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-notification-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-notification-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}