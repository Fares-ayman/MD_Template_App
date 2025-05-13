enum AppFlavor {
  dev,
  prod,
}

class Flavor {
  static AppFlavor appFlavor = AppFlavor.dev;

  static String get baseUrl {
    switch (appFlavor) {
      case AppFlavor.dev:
        return 'https://api.dev.com';
      case AppFlavor.prod:
        return 'https://api.prod.com';
    }
  }

  static String get flavorName {
    switch (appFlavor) {
      case AppFlavor.dev:
        return 'Dev';
      case AppFlavor.prod:
        return 'Prod';
    }
  }
}
