{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [ kitty pm2 python3 nodejs_20 git ];

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
        "npm"
      ];
      extraPackages = config.environment.systemPackages;
    };
  };
  system.stateVersion = "24.11";
}
