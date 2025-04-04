{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ kitty ];
  system.stateVersion = "24.11";
  services.github-runners = {
    python-app-runner = {
      enable = true;
      tokenFile = "/home/dt/universitate/sem6/serveru-testesana/cicd/actions-runner/python-app.token";
      url = "https://github.com/mdaugavietis/python-app";
      replace = true;
      extraLabels = [
        "nixos"
        "pm2"
        "python3"
      ];
      extraPackages = with pkgs; [ pm2 python3 nodejs_20 ];
    };
  };
}
