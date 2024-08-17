{
  pkgs,
  config,
  libs,
  ...
}:

{
  xdg.mime.defaultApplications = {
    # All text/* MIME types are subclasses of text/plain
    "text/plain" = "editor.desktop";
    "application/pdf" = "firefox.desktop";
  };
}
