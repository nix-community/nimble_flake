{
  description = ''High level GObject-Introspection based GTK3 bindings'';
  inputs."gintro-master".url = "path:./master";
  inputs."gintro-v0_1_0".url = "path:./v0_1_0";
  inputs."gintro-v0_2_0".url = "path:./v0_2_0";
  inputs."gintro-v0_4_0".url = "path:./v0_4_0";
  inputs."gintro-v0_4_1".url = "path:./v0_4_1";
  inputs."gintro-v0_4_10".url = "path:./v0_4_10";
  inputs."gintro-v0_4_11".url = "path:./v0_4_11";
  inputs."gintro-v0_4_14".url = "path:./v0_4_14";
  inputs."gintro-v0_4_15".url = "path:./v0_4_15";
  inputs."gintro-v0_4_16".url = "path:./v0_4_16";
  inputs."gintro-v0_4_17".url = "path:./v0_4_17";
  inputs."gintro-v0_4_18".url = "path:./v0_4_18";
  inputs."gintro-v0_4_2".url = "path:./v0_4_2";
  inputs."gintro-v0_4_20".url = "path:./v0_4_20";
  inputs."gintro-v0_4_22".url = "path:./v0_4_22";
  inputs."gintro-v0_4_23".url = "path:./v0_4_23";
  inputs."gintro-v0_4_3".url = "path:./v0_4_3";
  inputs."gintro-v0_4_4".url = "path:./v0_4_4";
  inputs."gintro-v0_4_5".url = "path:./v0_4_5";
  inputs."gintro-v0_4_6".url = "path:./v0_4_6";
  inputs."gintro-v0_4_7".url = "path:./v0_4_7";
  inputs."gintro-v0_4_8".url = "path:./v0_4_8";
  inputs."gintro-v0_4_9".url = "path:./v0_4_9";
  inputs."gintro-v0_5_0".url = "path:./v0_5_0";
  inputs."gintro-v0_5_1".url = "path:./v0_5_1";
  inputs."gintro-v0_5_2".url = "path:./v0_5_2";
  inputs."gintro-v0_5_3".url = "path:./v0_5_3";
  inputs."gintro-v0_5_4".url = "path:./v0_5_4";
  inputs."gintro-v0_5_5".url = "path:./v0_5_5";
  inputs."gintro-v0_6_0".url = "path:./v0_6_0";
  inputs."gintro-v0_6_1".url = "path:./v0_6_1";
  inputs."gintro-v0_7_0".url = "path:./v0_7_0";
  inputs."gintro-v0_7_1".url = "path:./v0_7_1";
  inputs."gintro-v0_7_2".url = "path:./v0_7_2";
  inputs."gintro-v0_7_3".url = "path:./v0_7_3";
  inputs."gintro-v0_7_4".url = "path:./v0_7_4";
  inputs."gintro-v0_7_5".url = "path:./v0_7_5";
  inputs."gintro-v0_7_6".url = "path:./v0_7_6";
  inputs."gintro-v0_7_7".url = "path:./v0_7_7";
  inputs."gintro-v0_7_8".url = "path:./v0_7_8";
  inputs."gintro-v0_7_9".url = "path:./v0_7_9";
  inputs."gintro-v0_8_0".url = "path:./v0_8_0";
  inputs."gintro-v0_8_1".url = "path:./v0_8_1";
  inputs."gintro-v0_8_2".url = "path:./v0_8_2";
  inputs."gintro-v0_8_3".url = "path:./v0_8_3";
  inputs."gintro-v0_8_4".url = "path:./v0_8_4";
  inputs."gintro-v0_8_5".url = "path:./v0_8_5";
  inputs."gintro-v0_8_6".url = "path:./v0_8_6";
  inputs."gintro-v0_8_7".url = "path:./v0_8_7";
  inputs."gintro-v0_8_8".url = "path:./v0_8_8";
  inputs."gintro-v0_8_9".url = "path:./v0_8_9";
  inputs."gintro-v0_9_0".url = "path:./v0_9_0";
  inputs."gintro-v0_9_1".url = "path:./v0_9_1";
  inputs."gintro-v0_9_2".url = "path:./v0_9_2";
  inputs."gintro-v0_9_3".url = "path:./v0_9_3";
  inputs."gintro-v0_9_4".url = "path:./v0_9_4";
  inputs."gintro-v0_9_5".url = "path:./v0_9_5";
  inputs."gintro-v0_9_6".url = "path:./v0_9_6";
  outputs = { self, nixpkgs, ...}@inputs:
    let lib = import ./lib.nix;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}