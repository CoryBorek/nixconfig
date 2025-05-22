{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.programs.starship;

in {

config = mkIf cfg.enable {

  programs.bash.bashrcExtra = "eval \"$(starship init bash)\"\n";

  programs.starship.settings = {
    format = "[](#3B4252)$python$username[](bg:#434C5E fg:#3B4252)$directory[](fg:#434C5E bg:#4C566A)$git_branch$git_status[](fg:#4C566A bg:#86BBD8)$c$elixir$elm$golang$haskell$java$julia$nodejs$nim$rust[](fg:#86BBD8 bg:#06969A)$docker_context[](fg:#06969A bg:#33658A)$time[ ](fg:#33658A)";
    username = {
      show_always = true;
      style_user = "bg:#3B4252";
      style_root = "bg:#3B4252";
      format = "[$user ]($style)";
    };

    directory = {
      style = "bg:#434C5E";
      format = "[ $path ]($style)";
      truncation_length = 3;
      truncation_symbol = "…/";
      substitutions = {
        "Documents" = " ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };
    };

    c = {
     symbol = " ";
     style = "bg:#86BBD8";
     format = "[ $symbol ($version) ]($style)";
    };

    docker_context = {
      symbol = " ";
      style = "bg:#06969A";
      format = "[ $symbol $context ]($style) $path";
    };

    git_branch = {
      symbol = "";
      style = "bg:#4C566A";
      format = "[ $symbol $branch ]($style)";
    };

    git_status = {
      style = "bg:#4C566A";
      format = "[$all_status$ahead_behind ]($style)";
    };
  
    java = {
      symbol = " ";
      style = "bg:#86BBD8";
      format = "[ $symbol ($version) ]($style)";
    };

    nodejs = {
      symbol = "";
      style = "bg:#86BBD8";
      format = "[ $symbol ($version) ]($style)";
    };

    time = {
      disabled = false;
      time_format = "%R";
      style = "bg:#33658A";
      format = "[ $time ]($style)";
    };

  };
  };
}
