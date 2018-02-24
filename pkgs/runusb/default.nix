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
    rev = "97f809a4b610a9030cfea403a73a135dca2f05df";
    sha256 = "1spcp17vn6j7l00fgxyc0zrz4ylpa48sdp96lhwzk1g6vdzak8y0";
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