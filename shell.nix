with import <nixpkgs> {};

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    rustup
    rust-analyzer
    rustPlatform.bindgenHook
  ];

  buildInputs = with pkgs; [
    # GUI?
    fontconfig  gdk-pixbuf cairo gtk3 webkitgtk wayland libxkbcommon
    busybox
  ];

  LD_LIBRARY_PATH = with pkgs.xorg; "${pkgs.mesa}/lib:${libX11}/lib:${libXcursor}/lib:${libXxf86vm}/lib:${libXi}/lib:${libXrandr}/lib:${pkgs.libGL}/lib:${pkgs.gtk3}/lib:${pkgs.cairo}/lib:${pkgs.gdk-pixbuf}/lib:${pkgs.fontconfig}/lib:${wayland}/lib:${libxkbcommon}/lib";

}