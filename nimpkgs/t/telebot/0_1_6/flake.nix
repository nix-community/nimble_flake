{
  description = ''Async Telegram Bot API Client'';
  inputs.src-telebot-0_1_6.flake = false;
  inputs.src-telebot-0_1_6.type = "github";
  inputs.src-telebot-0_1_6.owner = "ba0f3";
  inputs.src-telebot-0_1_6.repo = "telebot.nim";
  inputs.src-telebot-0_1_6.ref = "refs/tags/0.1.6";
  
  
  inputs."tempfile".url = "path:../../../t/tempfile";
  inputs."tempfile".type = "github";
  inputs."tempfile".owner = "riinr";
  inputs."tempfile".repo = "flake-nimble";
  inputs."tempfile".ref = "flake-pinning";
  inputs."tempfile".dir = "nimpkgs/t/tempfile";

  outputs = { self, nixpkgs, src-telebot-0_1_6, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-telebot-0_1_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-telebot-0_1_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}