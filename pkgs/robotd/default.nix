{ fetchFromGitHub
, libusb1
, python35Packages
, sb-vision
}:

python35Packages.buildPythonApplication rec {
  name = "robotd-${version}";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "sourcebots";
    repo = "robotd";
    rev = "761eeb09f9a6052147de7ea2b3a7722c78db24b5";
    sha256 = "1q44g8z4r8rnlkinrvwlrh9yc5hxzqn1mb31prny2wzjics83ybb";
  };

  buildInputs = [
    libusb1.dev
  ];

  propagatedBuildInputs = [
    python35Packages.cffi
    python35Packages.pyserial
    python35Packages.pyudev
    python35Packages.setproctitle
    sb-vision
  ];

  # Make libusb header file available as "libusb.h" as well as "libusb-1.0/libusb.h".
  NIX_CFLAGS_COMPILE = "-isystem ${libusb1.dev}/include/libusb-1.0";
}
