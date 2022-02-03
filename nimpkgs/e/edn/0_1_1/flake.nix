{
  description = ''EDN and Clojure parser'';
  inputs.src-edn-0_1_1.flake = false;
  inputs.src-edn-0_1_1.type = "github";
  inputs.src-edn-0_1_1.owner = "rosado";
  inputs.src-edn-0_1_1.repo = "edn.nim";
  inputs.src-edn-0_1_1.ref = "refs/tags/0.1.1";
  
  outputs = { self, nixpkgs, src-edn-0_1_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-edn-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-edn-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}