class DeviceService {
  /// Converts the numerical light value (0-120000 lux) into a concise description
  static String getLightLevel(double? lightValue) {
    if (lightValue == null) return "Unknown";

    if (lightValue < 45) {
      return "Dark";
    } else if (lightValue < 71) {
      return "Low";
    } else if (lightValue < 161) {
      return "Medium";
    } else if (lightValue < 501) {
      return "Bright";
    } else if (lightValue < 801) {
      return "Strong";
    } else {
      return "Intense";
    }
  }
}
