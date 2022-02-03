{
  description = ''Jsmn - a world fastest JSON parser - in pure Nim'';
  inputs.src-jsmn-0_1_4.flake = false;
  inputs.src-jsmn-0_1_4.type = "github";
  inputs.src-jsmn-0_1_4.owner = "OpenSystemsLab";
  inputs.src-jsmn-0_1_4.repo = "jsmn.nim";
  inputs.src-jsmn-0_1_4.ref = "refs/tags/0.1.4";
  
  outputs = { self, nixpkgs, src-jsmn-0_1_4, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-jsmn-0_1_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-jsmn-0_1_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}