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
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, niri, dankMaterialShell, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
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
            };
          }
          ./keyboard-shortcuts.nix
          ./variables.nix
          ./monitors.nix
          ./apps.nix
          ./file.nix 
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
  };
}
