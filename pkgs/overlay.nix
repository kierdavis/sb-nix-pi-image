self: super:

{
  robot-api = super.callPackage ./robot-api {};
  robotd = super.callPackage ./robotd {};
  runusb = super.callPackage ./runusb {};
  sb-vision = super.callPackage ./sb-vision {};
}
