{ fetchFromGitHub
, python35
, stdenv
}:

stdenv.mkDerivation rec {
  name = "runusb-${version}";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "sourcebots";
    repo = "runusb";
    rev = "2cb58ca3ded2004ee0a99bdffb600af7ad270443";
    sha256 = "01y244px6s34kynh9fci0wj8ipdy4lq8d1ls9k5iacxjdd3lb5sk";
  };

  phases = [ "unpackPhase" "installPhase" "fixupPhase" ];

  buildInputs = [ python35 ];

  installPhase = ''
    runHook preInstall
    install -D -m 0755 runusb -t $out/bin
    install -D -m 0755 sb-update -t $out/bin
    runHook postInstall
  '';
}