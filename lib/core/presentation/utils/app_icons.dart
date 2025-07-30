/// AppIcons class provides centralized access to all icon assets in the app
class AppIcons {
  // Private constructor to prevent instantiation
  AppIcons._();

  // Base path for icons
  static const String _basePath = 'assets/icons/';

  // Icon assets
  static const String search = '${_basePath}search.svg';

  // Method to get all icons (useful for asset preloading)
  static List<String> get allIcons => [
        search,
      ];
} 