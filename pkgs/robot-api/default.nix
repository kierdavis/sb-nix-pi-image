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
    rev = "5eb36c0d40e34fb2fb6c9c4997353f7d1e78db54";
    sha256 = "0x0rw8294qchja9hwh8b0cldjpazlmh42a2d1sx0ss3hrvvciwkl";
  };

  propagatedBuildInputs = [
    robotd
    sb-vision
  ];

  # Note that each test is run twice due to a bug in setuptools:
  # Bug: https://github.com/pypa/setuptools/issues/701
  # Fix: https://github.com/pypa/setuptools/commit/dbff2e7ed421be9ec96029366479a8627691e7f3
}
