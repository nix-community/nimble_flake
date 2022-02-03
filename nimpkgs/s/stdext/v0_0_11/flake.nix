{
  description = ''Extends stdlib make it easy on some case'';
  inputs.src-stdext-v0_0_11.flake = false;
  inputs.src-stdext-v0_0_11.type = "github";
  inputs.src-stdext-v0_0_11.owner = "zendbit";
  inputs.src-stdext-v0_0_11.repo = "nim.stdext";
  inputs.src-stdext-v0_0_11.ref = "refs/tags/v0.0.11";
  
  outputs = { self, nixpkgs, src-stdext-v0_0_11, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stdext-v0_0_11;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-stdext-v0_0_11"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}