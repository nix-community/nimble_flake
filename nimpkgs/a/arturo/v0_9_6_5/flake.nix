{
  description = ''Simple, modern and portable interpreted programming language for efficient scripting'';
  inputs.src-arturo-v0_9_6_5.flake = false;
  inputs.src-arturo-v0_9_6_5.type = "github";
  inputs.src-arturo-v0_9_6_5.owner = "arturo-lang";
  inputs.src-arturo-v0_9_6_5.repo = "arturo";
  inputs.src-arturo-v0_9_6_5.ref = "refs/tags/v0.9.6.5";
  
  outputs = { self, nixpkgs, src-arturo-v0_9_6_5, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-arturo-v0_9_6_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-arturo-v0_9_6_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}