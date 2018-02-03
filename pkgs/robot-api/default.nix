{ fetchFromGitHub
, python35Packages
, robotd
, sb-vision
, stdenv
}:

with stdenv.lib;

python35Packages.buildPythonPackage rec {
  name = "robot-api-${version}";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "sourcebots";
    repo = "robot-api";
    rev = "933c896959d6cd6237d5ed10043f5dd9802f1545";
    sha256 = "0xvlb1jnwn8771kbj3mdgcaifq44zdq3fjq1c5ascj4mlphws774";
  };

  propagatedBuildInputs = [
    robotd
    sb-vision
  ];

  # Note that each test is run twice due to a bug in setuptools:
  # Bug: https://github.com/pypa/setuptools/issues/701
  # Fix: https://github.com/pypa/setuptools/commit/dbff2e7ed421be9ec96029366479a8627691e7f3
}
