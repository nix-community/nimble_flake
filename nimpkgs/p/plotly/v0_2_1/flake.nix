{
  description = ''Nim interface to plotly'';
  inputs.src-plotly-v0_2_1.flake = false;
  inputs.src-plotly-v0_2_1.type = "github";
  inputs.src-plotly-v0_2_1.owner = "SciNim";
  inputs.src-plotly-v0_2_1.repo = "nim-plotly";
  inputs.src-plotly-v0_2_1.ref = "refs/tags/v0.2.1";
  
  
  inputs."chroma".url = "path:../../../c/chroma";
  inputs."chroma".type = "github";
  inputs."chroma".owner = "riinr";
  inputs."chroma".repo = "flake-nimble";
  inputs."chroma".ref = "flake-pinning";
  inputs."chroma".dir = "nimpkgs/c/chroma";

  
  inputs."jsbind".url = "path:../../../j/jsbind";
  inputs."jsbind".type = "github";
  inputs."jsbind".owner = "riinr";
  inputs."jsbind".repo = "flake-nimble";
  inputs."jsbind".ref = "flake-pinning";
  inputs."jsbind".dir = "nimpkgs/j/jsbind";

  
  inputs."webview".url = "path:../../../w/webview";
  inputs."webview".type = "github";
  inputs."webview".owner = "riinr";
  inputs."webview".repo = "flake-nimble";
  inputs."webview".ref = "flake-pinning";
  inputs."webview".dir = "nimpkgs/w/webview";

  
  inputs."ws".url = "path:../../../w/ws";
  inputs."ws".type = "github";
  inputs."ws".owner = "riinr";
  inputs."ws".repo = "flake-nimble";
  inputs."ws".ref = "flake-pinning";
  inputs."ws".dir = "nimpkgs/w/ws";

  outputs = { self, nixpkgs, src-plotly-v0_2_1, ...}@deps:
    let lib = import ./lib.nix;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-plotly-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "src-plotly-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}