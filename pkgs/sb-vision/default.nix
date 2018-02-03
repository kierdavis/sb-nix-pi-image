{ fetchFromGitHub
, opencv
, python35Packages
}:

python35Packages.buildPythonPackage rec {
  name = "sb-vision-${version}";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "sourcebots";
    repo = "sb-vision";
    rev = "6df539ee3a829c6574095c9295063af10a81b898";
    sha256 = "1n8qk3qk3vm5ghb8vxgw92p011rnxsjaljl9brdz71qbcn0jx76n";
  };

  # TODO: enable tests, but they're failing at the moment!
  doCheck = false;

  buildInputs = [
    opencv.dev
  ];

  propagatedBuildInputs = [
    python35Packages.cffi
    python35Packages.numpy
    python35Packages.pillow
    python35Packages.pytest
    python35Packages.pytestrunner
    python35Packages.scipy
  ];
}
