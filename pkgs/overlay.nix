self: super:

{
  robot-api = super.callPackage ./robot-api {};
  robotd = super.callPackage ./robotd {};
  sb-vision = super.callPackage ./sb-vision {};
}
