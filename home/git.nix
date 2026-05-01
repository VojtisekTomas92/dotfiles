{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Tomas Vojtisek";
        email = "vojtisektomas92@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
