{
  description = ''Async Telegram Bot API Client'';
  inputs.src-telebot-0_6_4.flake = false;
  inputs.src-telebot-0_6_4.type = "github";
  inputs.src-telebot-0_6_4.owner = "ba0f3";
  inputs.src-telebot-0_6_4.repo = "telebot.nim";
  inputs.src-telebot-0_6_4.ref = "refs/tags/0.6.4";
  
  
  inputs."sam".url = "path:../../../s/sam";
  inputs."sam".type = "github";
  inputs."sam".owner = "riinr";
  inputs."sam".repo = "flake-nimble";
  inputs."sam".ref = "flake-pinning";
  inputs."sam".dir = "nimpkgs/s/sam";

  outputs = { self, nixpkgs, src-telebot-0_6_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-telebot-0_6_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-telebot-0_6_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}