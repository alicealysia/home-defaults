{
  description = "Home Manager configuration of alice";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-cli = {
      url = "github:AvengeMedia/danklinux";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "nixpkgs";
      inputs.dms-cli.follows = "dms-cli";
    };
  };

  outputs =
    { nixpkgs, home-manager, niri, dankMaterialShell, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
          {
            home.stateVersion = "25.05";
            imports = [
              niri.homeModules.niri
              dankMaterialShell.homeModules.dankMaterialShell.default
              dankMaterialShell.homeModules.dankMaterialShell.niri
            ];
            programs.dankMaterialShell = {
              enable = true;
              enableSystemd = true;
              enableSystemMonitoring = true;
              enableClipboard = true;
              enableVPN = true;
              enableBrightnessControl = true;
              enableNightMode = true;
              enableDynamicTheming = true;
              enableAudioWavelength = true;
              enableCalendarEvents = true;
              niri.enableSpawn = true;
            };
            programs.niri.settings.input.focus-follows-mouse.enable = true;
            programs.niri.settings.input.keyboard.numlock = true;
          }
          ./keyboard-shortcuts.nix
          ./variables.nix
        ];
    in
    {
      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        inherit modules;
      };
      homeModules = modules;
  };
}
