{
  description = ''Async Telegram Bot API Client'';
  inputs.src-telebot-0_3_1.flake = false;
  inputs.src-telebot-0_3_1.type = "github";
  inputs.src-telebot-0_3_1.owner = "ba0f3";
  inputs.src-telebot-0_3_1.repo = "telebot.nim";
  inputs.src-telebot-0_3_1.ref = "refs/tags/0.3.1";
  
  outputs = { self, nixpkgs, src-telebot-0_3_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-telebot-0_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-telebot-0_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}