{
  description = ''Modular multithreading Linux HTTP server'';
  inputs.src-guildenstern-1_0_0.flake = false;
  inputs.src-guildenstern-1_0_0.type = "github";
  inputs.src-guildenstern-1_0_0.owner = "olliNiinivaara";
  inputs.src-guildenstern-1_0_0.repo = "GuildenStern";
  inputs.src-guildenstern-1_0_0.ref = "refs/tags/1.0.0";
  
  outputs = { self, nixpkgs, src-guildenstern-1_0_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-guildenstern-1_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-guildenstern-1_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}