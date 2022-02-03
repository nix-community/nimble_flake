{
  description = ''Async Telegram Bot API Client'';
  inputs.src-telebot-0_6_2.flake = false;
  inputs.src-telebot-0_6_2.type = "github";
  inputs.src-telebot-0_6_2.owner = "ba0f3";
  inputs.src-telebot-0_6_2.repo = "telebot.nim";
  inputs.src-telebot-0_6_2.ref = "refs/tags/0.6.2";
  
  
  inputs."sam".url = "path:../../../s/sam";
  inputs."sam".type = "github";
  inputs."sam".owner = "riinr";
  inputs."sam".repo = "flake-nimble";
  inputs."sam".ref = "flake-pinning";
  inputs."sam".dir = "nimpkgs/s/sam";

  outputs = { self, nixpkgs, src-telebot-0_6_2, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-telebot-0_6_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-telebot-0_6_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}