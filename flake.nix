{
  description = ''A QR code generation library.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."qrgen-develop".dir   = "develop";
  inputs."qrgen-develop".owner = "nim-nix-pkgs";
  inputs."qrgen-develop".ref   = "master";
  inputs."qrgen-develop".repo  = "qrgen";
  inputs."qrgen-develop".type  = "github";
  inputs."qrgen-develop".inputs.nixpkgs.follows = "nixpkgs";
  inputs."qrgen-develop".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."qrgen-main".dir   = "main";
  inputs."qrgen-main".owner = "nim-nix-pkgs";
  inputs."qrgen-main".ref   = "master";
  inputs."qrgen-main".repo  = "qrgen";
  inputs."qrgen-main".type  = "github";
  inputs."qrgen-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."qrgen-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."qrgen-v1_0_0".dir   = "v1_0_0";
  inputs."qrgen-v1_0_0".owner = "nim-nix-pkgs";
  inputs."qrgen-v1_0_0".ref   = "master";
  inputs."qrgen-v1_0_0".repo  = "qrgen";
  inputs."qrgen-v1_0_0".type  = "github";
  inputs."qrgen-v1_0_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."qrgen-v1_0_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}