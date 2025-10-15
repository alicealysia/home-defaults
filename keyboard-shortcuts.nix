{ config, lib, ... }: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+H".action                              = show-hotkey-overlay;
    "Mod+T".action.spawn                        = "wezterm";
    "Mod+E".action.spawn                        = "nautilus";
    "Mod+Shift+E".action.spawn                  = "firefox";
    "Mod+S".action.spawn                        = ["dms" "ipc" "spotlight" "toggle"];
    "Mod+P".action.spawn                        = ["hyprpicker" "-a"];
    "Mod+L".action.spawn                        = [ "dms" "ipc" "lock" "lock" ];
    "XF86AudioRaiseVolume".action.spawn         = ["dms" "ipc" "audio" "increment" "1"];
    "XF86AudioLowerVolume".action.spawn         = ["dms" "ipc" "audio" "decrement" "1"];
    "XF86MonBrightnessUp".action.spawn          = ["dms" "ipc" "brightness" "increment" "5" ""];
    "XF86MonBrightnessDown".action.spawn        = ["dms" "ipc" "brightness" "decrement" "5" ""];
    "XF86AudioMute".action.spawn                = ["dms" "ipc" "audio" "mute"];
    "XF86Launch7".action.spawn                  = "kcalc";
    "Mod+Q".action                              = close-window;
    "Mod+Shift+S".action                        = screenshot;
    "Mod+Tab".action                            = toggle-overview;

    "Mod+Left".action                           = focus-column-left;
    "Mod+Shift+WheelScrollUp".action            = focus-column-left;
    "Mod+Down".action                           = focus-window-down;
    "Mod+Up".action                             = focus-window-up;
    "Mod+Right".action                          = focus-column-right;
    "Mod+Shift+WheelScrollDown".action          = focus-column-right;
    
    "Mod+Ctrl+Left".action                      = move-column-left;
    "Mod+Ctrl+Shift+WheelScrollUp".action       = move-column-left;
    "Mod+Ctrl+Down".action                      = move-window-down;
    "Mod+Ctrl+Up".action                        = move-window-up;
    "Mod+Ctrl+Right".action                     = move-column-right;
    "Mod+Ctrl+Shift+WheelScrollDown".action     = move-column-right;
    

    "Mod+Shift+Left".action                     = focus-monitor-left;
    "Mod+Shift+Down".action                     = focus-monitor-down;
    "Mod+Shift+Up".action                       = focus-monitor-up;
    "Mod+Shift+Right".action                    = focus-monitor-right;

    "Mod+Shift+Ctrl+Left".action                = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+Down".action                = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+Up".action                  = move-column-to-monitor-up;
    "Mod+Shift+Ctrl+Right".action               = move-column-to-monitor-right;

    "Mod+Page_Down".action                      = focus-workspace-down;
    "Mod+Page_Up".action                        = focus-workspace-up;
    "Mod+Ctrl+Page_Down".action                 = move-column-to-workspace-down;
    "Mod+Ctrl+Page_Up".action                   = move-column-to-workspace-up;
    "Mod+Shift+Page_Down".action                = move-workspace-down;
    "Mod+Shift+Page_Up".action                  = move-workspace-up;

    "Mod+WheelScrollDown".action                = focus-workspace-down;
    "Mod+WheelScrollUp".action                  = focus-workspace-up;
    "Mod+Ctrl+WheelScrollDown".action           = move-column-to-workspace-down;
    "Mod+Ctrl+WheelScrollUp".action             = move-column-to-workspace-up;

    "Mod+1".action.focus-workspace              = 1;
    "Mod+2".action.focus-workspace              = 2;
    "Mod+3".action.focus-workspace              = 3;
    "Mod+4".action.focus-workspace              = 4;
    "Mod+5".action.focus-workspace              = 5;
    "Mod+6".action.focus-workspace              = 6;
    "Mod+7".action.focus-workspace              = 7;
    "Mod+8".action.focus-workspace              = 8;
    "Mod+9".action.focus-workspace              = 9;
    "Mod+Ctrl+1".action.move-column-to-workspace = 1;
    "Mod+Ctrl+2".action.move-column-to-workspace = 2;
    "Mod+Ctrl+3".action.move-column-to-workspace = 3;
    "Mod+Ctrl+4".action.move-column-to-workspace = 4;
    "Mod+Ctrl+5".action.move-column-to-workspace = 5;
    "Mod+Ctrl+6".action.move-column-to-workspace = 6;
    "Mod+Ctrl+7".action.move-column-to-workspace = 7;
    "Mod+Ctrl+8".action.move-column-to-workspace = 8;
    "Mod+Ctrl+9".action.move-column-to-workspace = 9;
    "Mod+BracketLeft".action                     = consume-or-expel-window-left;
    "Mod+BracketRight".action                    = consume-or-expel-window-right;
    "Mod+F".action                               = maximize-column;
    "Mod+Shift+F".action                         = fullscreen-window;
    "Mod+Ctrl+F".action                          = expand-column-to-available-width;
    "Mod+C".action                               = center-column;
    "Mod+Minus".action.set-column-width          = "-10%";
    "Mod+Equal".action.set-column-width          = "+10%";
    "Mod+Shift+Minus".action.set-window-height   = "-10%";
    "Mod+Shift+Equal".action.set-window-height   = "+10%";
    "Mod+Space".action                           = toggle-window-floating;
    "Mod+Shift+V".action                         = switch-focus-between-floating-and-tiling;
    "Mod+Shift+Tab".action                       = toggle-column-tabbed-display;
    "Mod+Escape" = {
      action = toggle-keyboard-shortcuts-inhibit;
      allow-inhibiting=false;
    };
    "Ctrl+Alt+Delete".action.spawn = [ "dms" "ipc" "powermenu" "toggle" ];
  };
}