{
  description = ''Nim module that converts Markdown text to HTML using only regular expressions. Based on jbroadway's Slimdown.'';
  inputs.src-slimdown-master.flake = false;
  inputs.src-slimdown-master.type = "github";
  inputs.src-slimdown-master.owner = "ruivieira";
  inputs.src-slimdown-master.repo = "nim-slimdown";
  inputs.src-slimdown-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, src-slimdown-master, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-slimdown-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-slimdown-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}