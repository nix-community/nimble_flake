{
  description = ''Implements a simple IRC client.'';
  inputs.src-irc-v0_2_0.flake = false;
  inputs.src-irc-v0_2_0.type = "github";
  inputs.src-irc-v0_2_0.owner = "nim-lang";
  inputs.src-irc-v0_2_0.repo = "irc";
  inputs.src-irc-v0_2_0.ref = "refs/tags/v0.2.0";
  
  outputs = { self, nixpkgs, src-irc-v0_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-irc-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-irc-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}