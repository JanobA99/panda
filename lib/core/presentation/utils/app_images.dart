/// AppImages class provides centralized access to all image assets in the app
class AppImages {
  // Private constructor to prevent instantiation
  AppImages._();

  // Base path for images
  static const String _basePath = 'assets/images/';

  // Image assets
  static const String geo = '${_basePath}geo.png';
  static const String panda = '${_basePath}panda.png';

  // Method to get all images (useful for asset preloading)
  static List<String> get allImages => [
        geo,
        panda,
      ];
} 