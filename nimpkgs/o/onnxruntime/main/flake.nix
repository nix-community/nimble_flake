{
  description = ''onnxruntime C Api wrapped for nim'';
  inputs.src-onnxruntime-main.flake = false;
  inputs.src-onnxruntime-main.type = "github";
  inputs.src-onnxruntime-main.owner = "YesDrX";
  inputs.src-onnxruntime-main.repo = "onnxruntime-nim";
  inputs.src-onnxruntime-main.ref = "refs/heads/main";
  
  outputs = { self, nixpkgs, src-onnxruntime-main, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-onnxruntime-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-onnxruntime-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}