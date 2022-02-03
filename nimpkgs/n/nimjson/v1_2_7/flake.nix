{
  description = ''nimjson generates nim object definitions from json documents.'';
  inputs.src-nimjson-v1_2_7.flake = false;
  inputs.src-nimjson-v1_2_7.type = "github";
  inputs.src-nimjson-v1_2_7.owner = "jiro4989";
  inputs.src-nimjson-v1_2_7.repo = "nimjson";
  inputs.src-nimjson-v1_2_7.ref = "refs/tags/v1.2.7";
  
  outputs = { self, nixpkgs, src-nimjson-v1_2_7, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimjson-v1_2_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimjson-v1_2_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}