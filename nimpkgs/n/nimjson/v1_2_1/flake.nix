{
  description = ''nimjson generates nim object definitions from json documents.'';
  inputs.src-nimjson-v1_2_1.flake = false;
  inputs.src-nimjson-v1_2_1.type = "github";
  inputs.src-nimjson-v1_2_1.owner = "jiro4989";
  inputs.src-nimjson-v1_2_1.repo = "nimjson";
  inputs.src-nimjson-v1_2_1.ref = "refs/tags/v1.2.1";
  
  outputs = { self, nixpkgs, src-nimjson-v1_2_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimjson-v1_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-nimjson-v1_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}