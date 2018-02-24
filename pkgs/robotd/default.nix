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
    rev = "e0be841816d4c778e98498193f6fd7e3de35813d";
    sha256 = "1zi363304cc2f31ymh0ip1f6qhmvbsh29ybcgxkl0mblrq78jpcy";
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
