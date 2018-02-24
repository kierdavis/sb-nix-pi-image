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
    rev = "463f08731e4ce6b9cd7033f254fa43c43485e12e";
    sha256 = "12ng4wfswvzapcwa0bxd32cqm7xxvgm1p54wjy2wh1a20brk1gs8";
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
