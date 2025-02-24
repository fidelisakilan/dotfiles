# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
    # Include the results of the hardware scan.
      ./hardware-configuration.nix

    (
      # Put the most recent revision here:
      let revision = "e26d456e9d9a33f66e1985ab4c06e1940352ef40"; in
      builtins.fetchTarball {
        url = "https://github.com/Jovian-Experiments/Jovian-NixOS/archive/${revision}.tar.gz"; # Update the hash as needed:
        sha256 = "sha256:0m7228z3qggrni1xpwpm5whcz459z4g5lqvs7yswdrrvinz1p930";
      } + "/modules"
    )
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixdeck"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fidelisakilan = {
    isNormalUser = true;
    description = "Fidelis Akilan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  # Add any missing dynamic libraries for unpackaged
  # programs here, NOT in environment.systemPackages
  ];
 
  # Plasma
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Pantheon
  # services.xserver.enable = true;
  # services.xserver.desktopManager.pantheon.enable = true;

  # SteamDeck UI
  jovian.steam = {
   enable = true;
   autoStart = true;
   user = "fidelisakilan";
   desktopSession = "plasma";
  };

  jovian.devices.steamdeck.enable = true;
  jovian.devices.steamdeck.enableGyroDsuService = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  security = {
  pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.steam.enable = true;
  programs.zsh.enable = true;
  services.tailscale.enable = true;
  virtualisation.virtualbox.host.enable = true;
  environment.systemPackages = with pkgs; [
  git
  nnn
  alejandra
  neofetch
  kitty
  wezterm
  spotify
  discord
  firefox
  protonup-qt
  kdePackages.partitionmanager
  unityhub
  jq
  stow
  btop
  killall
  mangohud
  alsa-utils
  playerctl
  brightnessctl
  libclang
  gcc
  python314
  flutter
  android-studio
  android-tools
  tmux
  unzip
  ripgrep
  rustup

  # Hyprland Packages
  # dunst
  # libnotify
  # rofi-wayland
  # hyprpaper
  # hyprshot
  # hyprlock
  # hypridle
  # waybar
  ];

  fonts.packages = with pkgs; [
    bqn386
    dina-font
    fira-code
    fira-code-symbols
    font-awesome
    iosevka
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    proggyfonts
    source-code-pro
    uiua386
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?

}

