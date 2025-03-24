{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      k = "k -hat";
      e = "emacs";
      s = "sway";
      dev = "devenv shell";
      mpv = "DRI_PRIME=1 mpv";
      fx = "DRI_PRIME=1 firefox";
      sync-nixos = "cp -r /etc/nixos/* ~/.config/nixos";
      second-screen = "alias second-screen='swaymsg output eDP-1 disable && swaymsg output DP-2 scale 1.25 mode 2560x1440@143.856Hz'";
      ls = "ls --color --group-directories-first";
      exa = "exa --group-directories-first";
    };

    history = {
      size = 99999;
      save = 99999;
      path = "${config.xdg.dataHome}/.config/history";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "supercrabtree/k"; }
      ];
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
         "git"
         "fzf"
         "history"
         "node"
         "rust"
         "direnv"
         "ssh-agent"
      ];
    };
  };
}
