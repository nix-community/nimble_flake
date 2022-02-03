{
  description = ''EDN and Clojure parser'';
  inputs.src-edn-0_2_0.flake = false;
  inputs.src-edn-0_2_0.type = "github";
  inputs.src-edn-0_2_0.owner = "rosado";
  inputs.src-edn-0_2_0.repo = "edn.nim";
  inputs.src-edn-0_2_0.ref = "refs/tags/0.2.0";
  
  outputs = { self, nixpkgs, src-edn-0_2_0, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-edn-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-edn-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}