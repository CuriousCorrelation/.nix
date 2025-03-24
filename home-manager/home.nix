{ config, pkgs, lib, ... }:

{
  imports = [ ./zsh ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "atis";
  home.homeDirectory = "/home/atis";

  home.keyboard.options = ["ctrl:nocaps"];

  # Allow unfree.
  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # Fonts
    merriweather
    (nerdfonts.override { fonts = [ "FantasqueSansMono" "FiraCode" "Iosevka" "JetBrainsMono" ]; })
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    direnv
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/atis/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.vscode = {
    enable = false;

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;

    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      vscodevim.vim
      yzhang.markdown-all-in-one
      ms-vsliveshare.vsliveshare
      rust-lang.rust-analyzer
      ms-azuretools.vscode-docker
      vue.volar
      bbenoist.nix
    ];

    # Settings
    userSettings = {
      "workbench.colorTheme" = "Gruvbox Dark Hard";
      "telemetry.telemetryLevel" = "off";
    };
  };

  programs.git = {
    enable = true;
    userName = "<username>";
    userEmail = "<username>@gmail.com";
  };

  xdg.enable = true;

  gtk = {
    enable = true;
    theme.name = "adw-gtk3";
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 16;
    };
    iconTheme.name = "GruvboxPlus";
  };

  # Cursor/Pointer
  home.pointerCursor = {
    name = "Bibata Modern Classic";
    package = pkgs.bibata-cursors;
    size = 16;
    x11 = {
      enable = true;
      defaultCursor = "Bibata Modern Classic";
    };
  };
}
