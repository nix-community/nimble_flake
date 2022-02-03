{
  description = ''Simplify Nim Inter-Thread Communication'';
  inputs.src-threadproxy-0_0_1.flake = false;
  inputs.src-threadproxy-0_0_1.type = "github";
  inputs.src-threadproxy-0_0_1.owner = "jackhftang";
  inputs.src-threadproxy-0_0_1.repo = "threadproxy.nim";
  inputs.src-threadproxy-0_0_1.ref = "refs/tags/0.0.1";
  
  outputs = { self, nixpkgs, src-threadproxy-0_0_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-threadproxy-0_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-threadproxy-0_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}